import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/screens/main_screen.dart';
import 'package:expenz/services/user_servicers.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the check box
  bool _remeberMe = false;

  //form key for the form validations
  final _formKey = GlobalKey<FormState>();

  //controller for the text form feilds
  final TextEditingController _userNameControler = TextEditingController();
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  final TextEditingController _confirmPasswordControler =
      TextEditingController();

  @override
  void dispose() {
    _userNameControler.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
    _confirmPasswordControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your \nPersonal Details",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //form feild for the user name
                      TextFormField(
                        controller: _userNameControler,
                        validator: (value) {
                          //check weather the user entered a valid user name
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //form feild for the user email
                      TextFormField(
                        controller: _emailControler,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your email";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //form feild for the user password
                      TextFormField(
                        controller: _passwordControler,
                        validator: (value) {
                          //check weather the user entered a valid user passwird
                          if (value!.isEmpty) {
                            return "Please Enter Your password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //form feild for the user confarm password
                      TextFormField(
                        controller: _confirmPasswordControler,
                        validator: (value) {
                          //check weather the user entered a valid user confirm password
                          if (value!.isEmpty) {
                            return "Please Enter The Same Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //remember me for the next time

                      Row(
                        children: [
                          const Text(
                            "Remember Me for the next time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kGrey,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _remeberMe,
                              onChanged: (value) {
                                setState(() {
                                  _remeberMe = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //submit button
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            //form is valid, process data
                            String userName = _userNameControler.text;
                            String email = _emailControler.text;
                            String password = _passwordControler.text;
                            String confirmPassword =
                                _confirmPasswordControler.text;

                            //save the user name and email in the device storage
                            await UserServicers.storeUserDetails(
                              userName: userName,
                              email: email,
                              password: password,
                              confirmPassword: confirmPassword,
                              context: context,
                            );

                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const MainScreen();
                                  },
                                ),
                              );
                            }
                          }
                        },
                        child: const CustomButton(
                          buttonName: "Next",
                          buttonColor: kMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
