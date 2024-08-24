import 'package:flutter/material.dart';

//income category enum
enum IncomeCategory {
  salary,
  freelance,
  passiveIncome,
  sales,
}

//income category images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.salary: "assets/images/salary.png",
  IncomeCategory.freelance: "assets/images/freelance.png",
  IncomeCategory.passiveIncome: "assets/images/car.png",
  IncomeCategory.sales: "assets/images/bill.png",
};

//income category color
final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.salary: const Color(0xFFFFD54F),
  IncomeCategory.freelance: const Color(0XFFE57373),
  IncomeCategory.passiveIncome: const Color(0xFF64B5F6),
  IncomeCategory.sales: const Color(0xFF64B5F6),
};

//income model
class IncomeModel {
  final int id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final DateTime time;
  final IncomeCategory category;

  IncomeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.time,
    required this.category,
  });
}