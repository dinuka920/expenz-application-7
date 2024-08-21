import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServicers {
  //methode to store the user name and user email in shared pref
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      //check weather the user entered password and the confirm Password are the same
      if (password != confirmPassword) {
        //show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password and Confirm password do not match"),
          ),
        );
        return;
      }

      //if the users password and conf password are same then store the users name and email

      //create a instance from shared pref
      SharedPreferences pref = await SharedPreferences.getInstance();
      //store the user name and email as key value pairs
      await pref.setString("userName", userName);
      await pref.setString("email", email);

      //show a message to the user
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User Details stored successfully"),
          ),
        );
      }
    } catch (err) {
      err.toString();
    }
  }

  //methode to check weather the userName is saved in the shared pref
  static Future<bool> checkUsername() async {
    //create an instance for shared pref
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString("userName");
    return userName != null;
  }
}
