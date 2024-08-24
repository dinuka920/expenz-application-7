import 'package:flutter/material.dart';

import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selectedMethode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethode == 0 ? kRed : kGreen,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kWhite,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethode = 0;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.053,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: _selectedMethode == 0 ? kRed : kWhite,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 10,
                            ),
                            child: Text(
                              "Expence",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: _selectedMethode == 0 ? kWhite : kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethode = 1;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.053,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: _selectedMethode == 1 ? kGreen : kWhite,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 10,
                            ),
                            child: Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: _selectedMethode == 1 ? kWhite : kBlack,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
