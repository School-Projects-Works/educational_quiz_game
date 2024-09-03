import 'package:educational_quiz_game/features/home/quiz/data/quiz_item.dart';
import 'package:educational_quiz_game/features/home/quiz/provider/quize_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/custom_input.dart';
import '../../../../utils/app_styles.dart';

class QuestionCard extends ConsumerStatefulWidget {
  const QuestionCard(
      {super.key, required this.selectedQuestion, required this.notifier});
  final SelectedQuestion selectedQuestion;
  final QuizItemProvider notifier;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionCardState();
}

class _QuestionCardState extends ConsumerState<QuestionCard> {
  final answerController = TextEditingController();
  @override
  void initState() {
    var question = widget.selectedQuestion.question;
    if (question.questionType != "MCQ") {
      answerController.text = widget.selectedQuestion.selectedAnswer;
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var style = CustomTextStyles();
    return Column(
      children: [
        Text(
          widget.selectedQuestion.question.question,
          style: style.titleStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: primaryColor),
        ),
        const SizedBox(height: 20),
        if (widget.selectedQuestion.question.questionType == 'MCQ')
          //display multiple choice questions
          //radio buttons
          Column(
            children: List.generate(
                widget.selectedQuestion.question.options.length, (index) {
              return RadioListTile(
                value: widget.selectedQuestion.question.options[index],
                groupValue: widget.selectedQuestion.selectedAnswer,
                onChanged: (value) {
                  widget.notifier.answerQuestion(
                      question: widget.selectedQuestion.question,
                      selectedAnswer: value.toString(),
                      answer: value.toString().substring(0, 1));
                },
                title: Text(
                  widget.selectedQuestion.question.options[index],
                  style: style.bodyStyle(),
                ),
              );
            }),
          )
        else
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: CustomTextFields(
              label: 'Enter your Answer',
              controller: TextEditingController(
                  text: widget.selectedQuestion.selectedAnswer),
              onChanged: (answer) {
                widget.notifier.answerQuestion(
                    question: widget.selectedQuestion.question,
                    selectedAnswer: answer.toString(),
                    answer: answer.toString().substring(0, 1));
              },
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
