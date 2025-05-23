import 'package:flutter/material.dart';
import 'package:rebirth_draft_2/Components/app_colors.dart';
import 'package:rebirth_draft_2/Components/buttons.dart';
import 'package:rebirth_draft_2/pages/Summary/summary_page.dart';

class NegativeHabits extends StatelessWidget {
  const NegativeHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Negative Habits to Avoid",

                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.secondaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Laziness, Procrastination...',
                  hintStyle: TextStyle(color: AppColors.hintColor),
                ),
                style: TextStyle(color: AppColors.textColor),
              ),
              SizedBox(height: 385),
              ElevatedButtonCustom(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SummaryPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
