import 'package:flutter/material.dart';

class QuizProgressBar extends StatelessWidget {
  final int totalQuestions;
  final int answeredQuestions;

  const QuizProgressBar({
    super.key,
    required this.totalQuestions,
    required this.answeredQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(totalQuestions, (index) {
        return Expanded(
          child: Container(
            //width: 20,
            height: 4,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              //shape: BoxShape.circle,
              color: index < answeredQuestions + 1
                  ? Colors.green
                  : Colors.grey, // unanswered question
            ),
          ),
        );
      }),
    );
  }

  
}
