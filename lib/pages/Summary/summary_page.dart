import 'package:flutter/material.dart';
import 'package:rebirth_draft_2/Components/app_colors.dart';
import 'package:rebirth_draft_2/Components/buttons.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Summary",

                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 165,
                child: Text(
                  "data",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 425),
              ElevatedButtonCustom(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const NegativeHabits(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
