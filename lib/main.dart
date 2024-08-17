import 'package:flutter/material.dart';

import 'package:expenz/screens/onboarding_screen.dart';

void main() {
  runApp(const MayApp());
}

class MayApp extends StatelessWidget {
  const MayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "inter",
      ),
      home: OnboardingScreen(),
    );
  }
}
