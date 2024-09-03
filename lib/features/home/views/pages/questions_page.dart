import 'dart:async';
import 'package:educational_quiz_game/core/widgets/custom_button.dart';
import 'package:educational_quiz_game/features/home/quiz/provider/quize_item_provider.dart';
import 'package:educational_quiz_game/features/home/views/components/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_styles.dart';
import '../components/progress_bar.dart';

class QuestionsPage extends ConsumerStatefulWidget {
  const QuestionsPage({super.key, required this.subject, required this.level});
  final String subject;
  final String level;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends ConsumerState<QuestionsPage> {
  int _countdown = 3;
  late Timer _quizTimer;
  late Timer _countdownTimer;
  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  int totalTime = 0;
  int seconds = 60;
  void _startCountdown() {
    totalTime = widget.level == 'Easy'
        ? 8
        : widget.level == 'Medium'
            ? 6
            : 3;
    //create a countdown in milliseconds and in seconds

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 0) {
        timer.cancel();
     _quizTimer=   Timer.periodic(const Duration(seconds: 1), (timer) {
          if (totalTime == 0) {
            timer.cancel();
          } else {
            setState(() {
              seconds--;
              if (seconds == 0) {
                totalTime--;
                seconds = 60;
              }
              if (totalTime == 0) {
                timer.cancel();
              }
            });
          }
        });
        //create a countdown in milliseconds and in seconds
      } else {
        setState(() {
          _countdown--;
        });
      }
    });
  }

  @override
  void dispose() {
    // close timer
    if(_countdownTimer.isActive) {
      _countdownTimer.cancel();
    }
    if(_quizTimer.isActive) {
      _quizTimer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var style = CustomTextStyles();
    var quizItemNotifier = ref.read(quizItemProvider(widget.subject).notifier);
    var quizItem = ref.watch(quizItemProvider(widget.subject));
    var selectedQuestion = quizItem.selectedQuestion;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _countdown == 0
            ? Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Question ${quizItem.questions.indexOf(selectedQuestion.question) + 1} of ${quizItem.questions.length}',
                            style: style.bodyStyle(),
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                          text: '',
                          style: style.bodyStyle(),
                          children: [
                            TextSpan(
                              text: '$totalTime : $seconds',
                              style: GoogleFonts.laila(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' s',
                              style: style.bodyStyle(),
                            ),
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    QuizProgressBar(
                      totalQuestions: quizItem.questions.length,
                      answeredQuestions: quizItem.answeredQuestions.length,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          QuestionCard(
                              selectedQuestion: selectedQuestion,
                              notifier: quizItemNotifier),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    quizItemNotifier.previousQuestion();
                                  },
                                  child: const Text('Previous')),
                              Expanded(
                                child: quizItem.questions.indexOf(
                                                selectedQuestion.question) +
                                            1 ==
                                        quizItem.questions.length
                                    ? CustomButton(
                                        text: 'Finish',
                                        radius: 5,
                                        color: primaryColor,
                                        onPressed: () {
                                          if(_quizTimer.isActive) {
                                            _quizTimer.cancel();
                                          }
                                          quizItemNotifier.finishQuiz(level: widget.level, ref: ref,context: context);
                                        })
                                    : CustomButton(
                                        text: 'Next',
                                        radius: 5,
                                        onPressed: () {
                                          quizItemNotifier.nextQuestion();
                                        },
                                      ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                    //next and skip button
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Your Quiz will start in', style: style.bodyStyle()),
                    Text(
                      '$_countdown',
                      style: const TextStyle(
                          fontSize: 80, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
