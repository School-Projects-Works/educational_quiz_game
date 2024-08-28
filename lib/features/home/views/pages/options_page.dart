import 'package:educational_quiz_game/core/widgets/custom_button.dart';
import 'package:educational_quiz_game/core/widgets/custom_dialog.dart';
import 'package:educational_quiz_game/core/widgets/custom_drop_down.dart';
import 'package:educational_quiz_game/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../generated/assets.dart';
import '../../provider/home_provider.dart';
import 'player_selection.dart';

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
    var level = ref.watch(difficultyLevelProvider);
    var size = MediaQuery.of(context).size;
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
                    value: level,
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
                      ref.read(difficultyLevelProvider.notifier).state =
                          value.toString();
                    }),
                const SizedBox(height: 20),
                CustomButton(
                    text: 'Start Playing',
                    color: Colors.blueGrey,
                    onPressed: () {
                      // navigate to the quiz page
                      if (level.isNotEmpty) {
                        //Todo go to the quiz page
                        //?set timer on the quiz page to the selected difficulty level
                      } else {
                        CustomDialogs.toast(
                            message: 'Please select a difficulty level');
                      }
                    }),
                const SizedBox(height: 20),
                CustomButton(
                    text: 'Find a Player',
                    color: Colors.green,
                    onPressed: () {
                      //show a modal bottom sheet with a list of players
                      showModalBottomSheet(
                          context: context,
                          isDismissible: false,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return const PlayerSelection();
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
