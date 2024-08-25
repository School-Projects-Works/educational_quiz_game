import 'package:educational_quiz_game/features/auth/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/functions/navigations.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_input.dart';
import '../../../generated/assets.dart';
import '../../../utils/app_styles.dart';

class ForgotPage extends ConsumerStatefulWidget {
  const ForgotPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPageState();
}

class _ForgotPageState extends ConsumerState<ForgotPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var style = CustomTextStyles();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(Assets.imagesEqLogoT, width: 200),
                  Text(
                    'Password Reset'.toUpperCase(),
                    style: style.titleStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFields(
                    hintText: 'User Email',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onChanged: (email) {},
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 22),
                  CustomButton(
                    text: 'Reset Password',
                    color: primaryColor,
                    onPressed: () {
                      if (_emailController.text.isNotEmpty) {}else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Email is required'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    radius: 5,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Back to ', style: style.bodyStyle()),
                      TextButton(
                        onPressed: () {
                          navigateAndReplace(context, const LoginPage());
                        },
                        child: Text(
                          'Login',
                          style: style.bodyStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
