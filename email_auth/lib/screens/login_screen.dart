// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:email_auth/components/rounded_button.dart';
import 'package:email_auth/constants.dart';
import 'package:email_auth/screens/home_screen.dart';
import 'package:email_auth/screens/registration_screen.dart';
import 'package:email_auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? userEmail;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
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
                        child: Image.asset('images/logo1.gif'),
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
                      ),
                    ),
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
                      buttonText: 'Log In',
                      color: Colors.lightBlueAccent,
                      onPressed: () async {
                        FocusManager.instance.primaryFocus!.unfocus();
                        if (userEmail == null && password == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('E-mail Id and Password, both can\'t be empty!!'),
                            ),
                          );
                        } else if (userEmail == null || password == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('E-mail Id or Password can\'t be empty!!'),
                            ),
                          );
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          final message = await AuthService.login(email: userEmail!, password: password!);
                          setState(() {
                            isLoading = false;
                          });
                          if (message.contains('Success')) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                              ),
                            );
                          }
                        }
                      },
                    ),
                    RoundedButton(
                      buttonText: 'Register',
                      color: Colors.grey.shade400,
                      onPressed: () async {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
