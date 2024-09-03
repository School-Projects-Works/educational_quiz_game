import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:educational_quiz_game/features/home/questions/data/question_model.dart';

class SelectedQuestion {
  final QuestionModel question;
  final String selectedAnswer;
  SelectedQuestion({
    required this.question,
    required this.selectedAnswer,
  });

  SelectedQuestion copyWith({
    QuestionModel? question,
    String? selectedAnswer,
  }) {
    return SelectedQuestion(
      question: question ?? this.question,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'question': question.toMap()});
    result.addAll({'selectedAnswer': selectedAnswer});
  
    return result;
  }

  factory SelectedQuestion.fromMap(Map<String, dynamic> map) {
    return SelectedQuestion(
      question: QuestionModel.fromMap(map['question']),
      selectedAnswer: map['selectedAnswer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectedQuestion.fromJson(String source) => SelectedQuestion.fromMap(json.decode(source));

  @override
  String toString() => 'SelectedQuestion(question: $question, selectedAnswer: $selectedAnswer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SelectedQuestion &&
      other.question == question &&
      other.selectedAnswer == selectedAnswer;
  }

  @override
  int get hashCode => question.hashCode ^ selectedAnswer.hashCode;
}
class QuizItem {
  String? id;
  String playerId;
  String playerName;
  String subject;
  String level;
  String playerImage;
  List<QuestionModel> questions;
  List<Map<String,dynamic>> answeredQuestions;
  SelectedQuestion selectedQuestion;
  int numOfCorrect;
  int numOfWrong;
  QuizItem({
    this.id,
    required this.playerId,
    required this.playerName,
    required this.subject,
    required this.level,
    required this.playerImage,
    required this.questions,
    required this.answeredQuestions,
    required this.selectedQuestion,
    required this.numOfCorrect,
    required this.numOfWrong,
  });

  static QuizItem empty() {
    return QuizItem(
      numOfCorrect: 0,
      numOfWrong: 0,
      playerId: '',
      playerName: '',
      subject: '',
      level: '',
      playerImage: '',
      questions: [],
      answeredQuestions: [],
      selectedQuestion: SelectedQuestion(question: QuestionModel.empty(), selectedAnswer: ''),
      
    );
  }

  QuizItem copyWith({
    String? id,
    String? playerId,
    String? playerName,
    String? subject,
    String? level,
    String? playerImage,
    List<QuestionModel>? questions,
    List<Map<String,dynamic>>? answeredQuestions,
    SelectedQuestion? selectedQuestion,
    int? numOfCorrect,
    int? numOfWrong,
  }) {
    return QuizItem(
      id: id ?? this.id,
      playerId: playerId ?? this.playerId,
      playerName: playerName ?? this.playerName,
      subject: subject ?? this.subject,
      level: level ?? this.level,
      playerImage: playerImage ?? this.playerImage,
      questions: questions ?? this.questions,
      answeredQuestions: answeredQuestions ?? this.answeredQuestions,
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
      numOfCorrect: numOfCorrect ?? this.numOfCorrect,
      numOfWrong: numOfWrong ?? this.numOfWrong,
    );
  }

  factory QuizItem.fromMap(Map<String, dynamic> map) {
    return QuizItem(
      id: map['id'],
      playerId: map['playerId'] ?? '',
      playerName: map['playerName'] ?? '',
      subject: map['subject'] ?? '',
      level: map['level'] ?? '',
      playerImage: map['playerImage'] ?? '',
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      answeredQuestions: List<Map<String,dynamic>>.from(map['answeredQuestions']?.map((x) => Map<String,dynamic>.from(x))),
      selectedQuestion: SelectedQuestion.fromMap(map['selectedQuestion']),
      numOfCorrect: map['numOfCorrect']?.toInt() ?? 0,
      numOfWrong: map['numOfWrong']?.toInt() ?? 0,
    );
  }

  factory QuizItem.fromJson(String source) =>
      QuizItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizItem(id: $id, playerId: $playerId, playerName: $playerName, subject: $subject, level: $level, playerImage: $playerImage, questions: $questions, answeredQuestions: $answeredQuestions, selectedQuestion: $selectedQuestion, numOfCorrect: $numOfCorrect, numOfWrong: $numOfWrong)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuizItem &&
      other.id == id &&
      other.playerId == playerId &&
      other.playerName == playerName &&
      other.subject == subject &&
      other.level == level &&
      other.playerImage == playerImage &&
      listEquals(other.questions, questions) &&
      listEquals(other.answeredQuestions, answeredQuestions) &&
      other.selectedQuestion == selectedQuestion &&
      other.numOfCorrect == numOfCorrect &&
      other.numOfWrong == numOfWrong;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      playerId.hashCode ^
      playerName.hashCode ^
      subject.hashCode ^
      level.hashCode ^
      playerImage.hashCode ^
      questions.hashCode ^
      answeredQuestions.hashCode ^
      selectedQuestion.hashCode ^
      numOfCorrect.hashCode ^
      numOfWrong.hashCode;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'playerId': playerId});
    result.addAll({'playerName': playerName});
    result.addAll({'subject': subject});
    result.addAll({'level': level});
    result.addAll({'playerImage': playerImage});
    result.addAll({'questions': questions.map((x) => x.toMap()).toList()});
    result.addAll({'answeredQuestions': answeredQuestions});
    result.addAll({'selectedQuestion': selectedQuestion.toMap()});
    result.addAll({'numOfCorrect': numOfCorrect});
    result.addAll({'numOfWrong': numOfWrong});
  
    return result;
  }

  String toJson() => json.encode(toMap());
}
