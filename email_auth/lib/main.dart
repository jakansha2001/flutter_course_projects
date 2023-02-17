import 'package:email_auth/firebase_options.dart';
import 'package:email_auth/screens/login_screen.dart';
import 'package:email_auth/screens/registration_screen.dart';
import 'package:email_auth/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //initializing the firebase app ensuring that the UI is not rendered until our initialization is not done
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EmailAuth());
}

class EmailAuth extends StatelessWidget {
  const EmailAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: const TextTheme(
      //     bodyText1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.id, //home property and initialRoute property can't be used together
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
      },
      home: const WelcomeScreen(),
    );
  }
}
