import 'package:educational_quiz_game/core/functions/navigations.dart';
import 'package:educational_quiz_game/core/widgets/custom_button.dart';
import 'package:educational_quiz_game/core/widgets/custom_drop_down.dart';
import 'package:educational_quiz_game/features/auth/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/custom_input.dart';
import '../../../generated/assets.dart';
import '../../../utils/app_styles.dart';
import '../provider/auth_provider.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var style = CustomTextStyles();
    var notifier = ref.read(userProvider.notifier);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome to', style: style.bodyStyle()),
                    Image.asset(Assets.imagesEqLogoT, width: 200),
                    Text(
                      'User Registration'.toUpperCase(),
                      style: style.titleStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //username
                    CustomTextFields(
                      label: 'User Name',
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.text,
                      onSaved: (name) {
                        notifier.setUserName(name!);
                      },
                      validator: (name) {
                        if (name == null || name.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFields(
                      label: 'User Email',
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
                    //gender
                    CustomDropDown(
                      validator: (gender) {
                        if (gender == null) {
                          return 'User gender is required';
                        }
                        return null;
                      },
                      label: 'User Gender',
                      onChanged: (gender) {
                        notifier.setUserGender(gender.toString());
                      },
                      onSaved: (gender) {
                        notifier.setUserGender(gender.toString());
                      },
                      prefixIcon: Icons.male,
                      items: ['Male', 'Female'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 22),
                    CustomTextFields(
                      label: 'User Password',
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
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: primaryColor,
                          )),
                    ),
                    const SizedBox(height: 22),
                    CustomButton(
                        text: 'Register',
                        color: primaryColor,
                        radius: 5,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //save
                            _formKey.currentState!.save();
                            notifier.createUser(context: context);
                          }
                        }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Already have an account? ',
                            style: style.bodyStyle()),
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
      ),
    );
  }
}
