import 'package:flutter/material.dart';

//expence category enum
enum ExpenceCategory {
  shopping,
  subscriptions,
  food,
  health,
  transport,
}

//expence category image
final Map<ExpenceCategory, String> expenceCategoryImages = {
  ExpenceCategory.shopping: "assets/images/bag.png",
  ExpenceCategory.subscriptions: "assets/images/bill.png",
  ExpenceCategory.food: "assets/images/restaurant.png",
  ExpenceCategory.health: "assets/images/health.png",
  ExpenceCategory.transport: "assets/images/car.png",
};

//expence category color
final Map<ExpenceCategory, Color> expenceCategoryColors = {
  ExpenceCategory.food: const Color(0xFFE57373),
  ExpenceCategory.transport: const Color(0xFF81C784),
  ExpenceCategory.health: const Color(0xFF64B5F6),
  ExpenceCategory.shopping: const Color(0xFFFFD54F),
  ExpenceCategory.subscriptions: const Color(0xFF9575CD),
};

//expence model
class ExpenceModel {
  final int id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final DateTime time;
  final ExpenceCategory category;

  ExpenceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.time,
    required this.category,
  });

  //Convert the expense object to a JSON object
  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "amount": amount,
      "date": date.toIso8601String(),
      "time": time.toIso8601String(),
      "category": category.index,
    };
  }

  //create an Expense object from a JSON object
  factory ExpenceModel.fromJSON(Map<String, dynamic> json) {
    return ExpenceModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      amount: json["amount"],
      date: DateTime.parse(json["date"]),
      time: DateTime.parse(json["time"]),
      category: ExpenceCategory.values[json["category"]],
    );
  }
}
