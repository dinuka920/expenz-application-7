import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/models/expence_model.dart';
import 'package:expenz/widgets/expese_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final List<ExpenceModel> expensesList;
  final void Function(ExpenceModel) onDismissedExpense;
  const TransactionScreen({
    super.key,
    required this.expensesList,
    required this.onDismissedExpense,
  });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "See your financial report",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kMainColor),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //show the all expenses
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.expensesList.length,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final expense = widget.expensesList[index];
                          return Dismissible(
                            key: ValueKey(expense),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) {
                              setState(() {
                                widget.onDismissedExpense(expense);
                              });
                            },
                            child: ExpeseCard(
                              title: expense.title,
                              description: expense.description,
                              amount: expense.amount,
                              date: expense.date,
                              time: expense.time,
                              category: expense.category,
                            ),
                          );
                        },
                      ),
                    ],
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
