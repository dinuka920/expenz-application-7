import 'package:expenz/constants/colors.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "Expenz",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: kMainColor,
            ),
          ),
        )
      ],
    );
  }
}
