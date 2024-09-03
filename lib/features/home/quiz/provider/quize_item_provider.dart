import 'dart:math';
import 'package:educational_quiz_game/core/functions/navigations.dart';
import 'package:educational_quiz_game/core/widgets/custom_dialog.dart';
import 'package:educational_quiz_game/features/home/questions/data/question_model.dart';
import 'package:educational_quiz_game/features/home/questions/provider/questions_provider.dart';
import 'package:educational_quiz_game/features/home/quiz/data/quiz_item.dart';
import 'package:educational_quiz_game/features/home/views/components/score_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizItemProvider =
    StateNotifierProvider.family<QuizItemProvider, QuizItem, String>(
        (ref, subject) {
  //get random int from 20 to 30
  var random = Random();
  var randomInt = random.nextInt(30 - 20) + 20;
  var questions = ref
      .watch(questionsProvider)
      .where(
          (element) => element.subject.toLowerCase() == subject.toLowerCase())
      .toList();
  //shuffle the questions
  questions.shuffle();
  //get the first 10 questions
  questions = questions.sublist(0, min(questions.length, randomInt));
  return QuizItemProvider()..setQuestions(question: questions,subject: subject);
});

class QuizItemProvider extends StateNotifier<QuizItem> {
  QuizItemProvider() : super(QuizItem.empty());

  void setQuestions({required List<QuestionModel> question, required String subject}) {
    state = state.copyWith(
        questions: question,
        subject: subject,
        selectedQuestion:
            SelectedQuestion(question: question[0], selectedAnswer: ''));
  }

  void nextQuestion() {
    var index = state.questions.indexOf(state.selectedQuestion.question);
    if (index + 1 < state.questions.length) {
      state = state.copyWith(
          selectedQuestion: SelectedQuestion(
              question: state.questions[index + 1], selectedAnswer: ''),
          answeredQuestions: [
            ...state.answeredQuestions,
            {
              'question': state.selectedQuestion.question,
              'selectedAnswer': state.selectedQuestion.selectedAnswer
            }
          ]);
    }
  }

  void answerQuestion(
      {required QuestionModel question,
      required String answer,
      required String selectedAnswer}) {
    var selectedQuestion = state.selectedQuestion;
    selectedQuestion =
        selectedQuestion.copyWith(selectedAnswer: selectedAnswer);
    state = state.copyWith(answeredQuestions: [
      ...state.answeredQuestions,
    ], selectedQuestion: selectedQuestion);
  }

  void previousQuestion() {
    var index = state.questions.indexOf(state.selectedQuestion.question) - 1;
    if (index >= 0) {
      var question = state.questions[index];
      var previousQuestion = state.answeredQuestions
          .where((element) => element['question'] == question)
          .toList()
          .firstOrNull;
      if (previousQuestion != null) {
        state = state.copyWith(
            answeredQuestions: state.answeredQuestions
                .where((element) => element['question'] != question)
                .toList(),
            selectedQuestion: SelectedQuestion(
                question: question,
                selectedAnswer: previousQuestion['selectedAnswer']));
      }
      else{
        state = state.copyWith(
            selectedQuestion: SelectedQuestion(
                question: question,
                selectedAnswer: ''));
      }
    }
  }

  void finishQuiz({required String level,required WidgetRef ref,required BuildContext context}) async {
    CustomDialogs.loading(message: 'Calculating results.....');
    var numOfCorrect = 0;
    var numOfWrong = 0;
    for (var question in state.answeredQuestions) {
      if (question['question'].answer.toString().toLowerCase().trim() == question['selectedAnswer'].toString().toLowerCase().trim()) {
        numOfCorrect++;
      } else {
        numOfWrong++;
      }
    }
    state = state.copyWith(
      level: level,
        numOfCorrect: numOfCorrect, numOfWrong: numOfWrong);
    CustomDialogs.dismiss();
    navigateTransparentRoute(context, ScorePage(quizItem: state));

  }
}
