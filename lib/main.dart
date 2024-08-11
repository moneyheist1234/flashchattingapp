import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chatting/screens/welcome_screen.dart';
import 'package:chatting/screens/login_screen.dart';
import 'package:chatting/screens/registration_screen.dart';
import 'package:chatting/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDvNjsYuC7k20jTJ-bFenz9x_aXtWz94ig',
        appId: '1:1030125746246:android:7b0ca5265d83ae44cab247',
        messagingSenderId: '1030125746246',
        projectId: 'flashchat-6fb00',
        androidClientId: '1:1030125746246:android:7b0ca5265d83ae44cab247',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  FlashChat({Key? key}) : super(key: key);

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
