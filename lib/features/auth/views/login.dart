import 'package:educational_quiz_game/core/functions/navigations.dart';
import 'package:educational_quiz_game/core/widgets/custom_button.dart';
import 'package:educational_quiz_game/core/widgets/custom_input.dart';
import 'package:educational_quiz_game/features/auth/views/forgot_password_page.dart';
import 'package:educational_quiz_game/features/auth/views/register_page.dart';
import 'package:educational_quiz_game/generated/assets.dart';
import 'package:educational_quiz_game/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var style = CustomTextStyles();
    var notifier = ref.read(userProvider.notifier);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome to', style: style.bodyStyle()),
                    Image.asset(Assets.imagesEqLogoT, width: 200),
                    Text(
                      'User Login'.toUpperCase(),
                      style: style.titleStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFields(
                      hintText: 'User Email',
                      prefixIcon: Icons.email,
                      onSaved: (email) {
                        notifier.setUserEmail(email!);
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 22),
                    CustomTextFields(
                      hintText: 'User Password',
                      onSaved: (password) {
                        notifier.setUserPassword(password!);
                      },
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isObscure,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    ),
                    const SizedBox(height: 10),
                    //textButton
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          navigateAndReplace(context, const ForgotPage());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: style.bodyStyle(color: primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      text: 'Login',
                      color: primaryColor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //save 
                          _formKey.currentState!.save();
                          notifier.login(context: context);
                        }
                      },
                      radius: 5,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Don\'t have an account? ',
                            style: style.bodyStyle()),
                        TextButton(
                          onPressed: () {
                            navigateAndReplace(context, const RegisterPage());
                          },
                          child: Text(
                            'Sign Up',
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
      ),
    );
  }
}
