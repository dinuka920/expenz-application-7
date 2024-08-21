import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:expenz/services/user_servicers.dart';
import 'package:expenz/widgets/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MayApp());
}

class MayApp extends StatelessWidget {
  const MayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServicers.checkUsername(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          //here the has userName will be set to ture of the data is ther in the snapshot and otherwise false
          bool hasUserName = snapshot.data ?? false;
          return MaterialApp(
            title: "Expenz",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "inter",
            ),
            home: Wrapper(showMainScreen: hasUserName),
          );
        }
      },
    );
  }
}
