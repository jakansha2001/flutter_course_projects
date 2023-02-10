// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:email_auth/components/rounded_button.dart';
import 'package:email_auth/constants.dart';
import 'package:email_auth/screens/login_screen.dart';
import 'package:email_auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String id = 'registrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? userEmail;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: SizedBox(
                        height: 200.0,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          userEmail = value;
                        },
                        decoration: textFieldInputDecoration.copyWith(
                          hintText: 'Enter your email',
                        )),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: textFieldInputDecoration.copyWith(
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    RoundedButton(
                      buttonText: 'Register',
                      color: Colors.blueAccent,
                      onPressed: () async {
                        FocusManager.instance.primaryFocus!.unfocus();

                        if (userEmail == null || password == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('E-mail Id and Password can\'t be empty!!'),
                            ),
                          );
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          final message = await AuthService.registration(email: userEmail!, password: password!);
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );
                          if (message.contains('Success')) {
                            Navigator.pushNamed(context, LoginScreen.id);
                          }
                        }
                      },
                    ),
                    RoundedButton(
                      buttonText: 'Log in',
                      color: Colors.grey.shade400,
                      onPressed: () async {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
