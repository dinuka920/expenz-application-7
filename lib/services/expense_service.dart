import 'dart:convert';

import 'package:expenz/models/expence_model.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ExpenseSercive {
  //Define the key for storing expenses in shared preferences
  static const String _expenseKey = 'expenses';

  //Save the expense to shared preferences
  Future<void> saveExpenses(ExpenceModel expense, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String>? existingExpenses = prefs.getStringList(_expenseKey);

      //Convert the existing expenses to a list of Expense objects
      List<ExpenceModel> existingExpenseObjects = [];

      if (existingExpenses != null) {
        existingExpenseObjects = existingExpenses
            .map((e) => ExpenceModel.fromJSON(json.decode(e)))
            .toList();
      }

      // Add the new expense to the list
      existingExpenseObjects.add(expense);

      // Convert the list of Expense objects back to a list of strings
      List<String> updatedExpenses =
          existingExpenseObjects.map((e) => json.encode(e.toJSON())).toList();

      // Save the updated list of expenses to shared preferences
      await prefs.setStringList(_expenseKey, updatedExpenses);

      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Expense added successfully!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error on Adding Expense!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //Load the expenses from shared preferences
  Future<List<ExpenceModel>> loadExpenses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingExpenses = pref.getStringList(_expenseKey);

    // Convert the existing expenses to a list of Expense objects
    List<ExpenceModel> loadedEpenses = [];
    if (existingExpenses != null) {
      loadedEpenses = existingExpenses
          .map((e) => ExpenceModel.fromJSON(json.decode(e)))
          .toList();
    }

    return loadedEpenses;
  }

  // delete the expense from shared prefarences from the id
  Future<void> deleteExpense(int id, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingExpenses = pref.getStringList(_expenseKey);

      //convert the existing expenses to a list of expense objects
      List<ExpenceModel> existingExpenseObject = [];
      if (existingExpenses != null) {
        existingExpenseObject = existingExpenses
            .map(
              (e) => ExpenceModel.fromJSON(json.decode(e)),
            )
            .toList();
      }

      //remove the expense with the specified id from the list
      existingExpenseObject.removeWhere(
        (expense) => expense.id == id,
      );
      //convert the list of expense object back to a list of strings
      List<String> updatedExpenses = existingExpenseObject
          .map(
            (e) => json.encode(e.toJSON()),
          )
          .toList();
      //save the updated List of expenses to shared prefarances
      await pref.setStringList(_expenseKey, updatedExpenses);

      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Expenses Deleted sucsesfully!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      print(error.toString());

      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error deleteing Expense!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
