import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/widgets/custom_button.dart';

import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  //varibles
  int _selectedMethode = 0;
  ExpenceCategory _expenceCategory = ExpenceCategory.shopping;
  IncomeCategory _incomeCategory = IncomeCategory.freelance;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  //text input controlers
  final TextEditingController _titleControoller = TextEditingController();
  final TextEditingController _discriptionControoller = TextEditingController();
  final TextEditingController _amountControoller = TextEditingController();

  @override
  void dispose() {
    _titleControoller.dispose();
    _discriptionControoller.dispose();
    _amountControoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethode == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              //expence and income toggle menu
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding * 2,
                ),
                child: Container(
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
                      ),
                    ],
                  ),
                ),
              ),

              //Amount feild
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How much?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kLightGrey.withOpacity(0.8),
                        ),
                      ),
                      const TextField(
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: kWhite),
                        decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                ),
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    child: Column(
                      children: [
                        //category selector dropdown
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: kDefaultPadding,
                            ),
                          ),
                          items: _selectedMethode == 0
                              ? ExpenceCategory.values.map(
                                  (category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  },
                                ).toList()
                              : IncomeCategory.values.map(
                                  (category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  },
                                ).toList(),
                          value: _selectedMethode == 0
                              ? _expenceCategory
                              : _incomeCategory,
                          onChanged: (value) {
                            setState(() {
                              _selectedMethode == 0
                                  ? _expenceCategory = value as ExpenceCategory
                                  : _incomeCategory = value as IncomeCategory;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //title Field
                        TextFormField(
                          controller: _titleControoller,
                          decoration: InputDecoration(
                            hintText: "Title",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: kDefaultPadding,
                            ),
                            hintStyle: const TextStyle(color: kGrey),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        //description Field
                        TextFormField(
                          controller: _discriptionControoller,
                          decoration: InputDecoration(
                            hintText: "Description",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: kDefaultPadding,
                            ),
                            hintStyle: const TextStyle(color: kGrey),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        //amount Field
                        TextFormField(
                          controller: _amountControoller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Amount",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: kDefaultPadding,
                            ),
                            hintStyle: const TextStyle(color: kGrey),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        //date pikker
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  initialDate: DateTime.now(),
                                  context: context,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2025),
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      setState(() {
                                        _selectedDate = value;
                                      });
                                    }
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kMainColor,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        color: kWhite,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Select Date",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: kWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(_selectedDate),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kGrey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      setState(() {
                                        _selectedTime = DateTime(
                                          _selectedDate.year,
                                          _selectedDate.month,
                                          _selectedDate.day,
                                          value.hour,
                                          value.minute,
                                        );
                                      });
                                    }
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kYellow,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timer_outlined,
                                        color: kWhite,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Select Time",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: kWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.jm().format(_selectedTime),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kGrey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: kLightGrey,
                          thickness: 5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          buttonName: "Add",
                          buttonColor: _selectedMethode == 0 ? kRed : kGreen,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
