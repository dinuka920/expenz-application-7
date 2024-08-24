import 'package:expenz/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:expenz/constants/colors.dart';

class IncomeExpenceCard extends StatefulWidget {
  final Color bgColor;
  final String title;
  final double amount;
  final String imagUrl;
  const IncomeExpenceCard({
    super.key,
    required this.bgColor,
    required this.title,
    required this.amount,
    required this.imagUrl,
  });

  @override
  State<IncomeExpenceCard> createState() => _IncomeExpenceCardState();
}

class _IncomeExpenceCardState extends State<IncomeExpenceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.108,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kWhite,
              ),
              child: Center(
                child: Image.asset(
                  widget.imagUrl,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: kWhite,
                  ),
                ),
                Text(
                  "\$${widget.amount.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kWhite,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
