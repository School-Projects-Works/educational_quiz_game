import 'package:educational_quiz_game/core/widgets/custom_button.dart';
import 'package:educational_quiz_game/core/widgets/custom_drop_down.dart';
import 'package:educational_quiz_game/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../generated/assets.dart';

class OptionsPage extends ConsumerStatefulWidget {
  const OptionsPage({super.key, required this.subject});
  final String subject;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OptionsPageState();
}

class _OptionsPageState extends ConsumerState<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    var style = CustomTextStyles();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(Assets.imagesEqLogoT, width: 100),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  Assets.imagesQuiz,
                  width: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Find another player online and play with or select start playing to play alone',
                    textAlign: TextAlign.center,
                    style: style.bodyStyle(),
                  ),
                ),
                const SizedBox(height: 20),
                //select difficulty level
                CustomDropDown(
                    label: 'Select Difficulty Level',
                    items: [
                      'Easy',
                      'Medium',
                      'Hard',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // set the difficulty level
                    }),
                const SizedBox(height: 20),
                CustomButton(
                    text: 'Start Playing',
                    color: Colors.blueGrey,
                    onPressed: () {
                      // navigate to the quiz page
                    }),
                const SizedBox(height: 20),
                CustomButton(
                    text: 'Find a Player',
                    color: Colors.green,
                    onPressed: () {
                      // navigate to the multiplayer page
                    }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
