import 'package:educational_quiz_game/generated/assets.dart';
import 'package:educational_quiz_game/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../quiz/data/quiz_item.dart';

class ScorePage extends ConsumerWidget {
  const ScorePage({super.key, required this.quizItem});
  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var style = CustomTextStyles();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(.6),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                                            quizItem.numOfCorrect>=quizItem.questions.length/2?Assets.imageWinner:Assets.imageLose,
                          width: 300,
                        ),
                      ),
                      Text(
                        'Score: ${quizItem.numOfCorrect * 3}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Correct Answers: ${quizItem.numOfCorrect}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Wrong Answers: ${quizItem.numOfWrong}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Total Questions: ${quizItem.questions.length}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
