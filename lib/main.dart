import 'package:flutter/material.dart';

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
      home: const Scaffold(
        body: Center(
          child: Text(
            "Hello Flutter",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
