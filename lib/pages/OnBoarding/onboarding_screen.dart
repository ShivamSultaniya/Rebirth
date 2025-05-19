import 'package:flutter/material.dart';
import 'package:rebirth_draft_2/Components/app_colors.dart';
import 'package:auto_hide_keyboard/auto_hide_keyboard.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tell us about yourself',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                AutoHideKeyboard(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: AppColors.hintColor),
                    ),
                    style: TextStyle(color: AppColors.textColor),
                  ),
                ),
                SizedBox(height: 20),
                AutoHideKeyboard(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Age',
                      hintStyle: TextStyle(color: AppColors.hintColor),
                    ),
                    style: TextStyle(color: AppColors.textColor),
                  ),
                ),
                SizedBox(height: 20),
                AutoHideKeyboard(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Location',
                      hintStyle: TextStyle(color: AppColors.hintColor),
                    ),
                    style: TextStyle(color: AppColors.textColor),
                  ),
                ),
                SizedBox(height: 20),
                AutoHideKeyboard(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Occupation',
                      hintStyle: TextStyle(color: AppColors.hintColor),
                    ),
                    style: TextStyle(color: AppColors.textColor),
                  ),
                ),
                SizedBox(height: 20),
                DropdownMenuExample(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum GenderLabel {
  male('Male'),
  female('Female'),
  other('Other'),
  preferNotToSay('Prefer not to say');

  const GenderLabel(this.label);
  final String label;
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController genderController = TextEditingController();
  GenderLabel? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 300,
          child: Theme(
            data: Theme.of(context).copyWith(
              textTheme: const TextTheme(
                titleMedium: TextStyle(
                  color: AppColors.textColor, // Text color for selected item
                ),
              ),
            ),
            child: DropdownMenu<GenderLabel>(
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: AppColors.secondaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              controller: genderController,
              requestFocusOnTap: true,
              label: const Text(
                'Gender',
                style: TextStyle(color: AppColors.hintColor),
              ),
              onSelected: (GenderLabel? gender) {
                setState(() {
                  selectedGender = gender;
                });
              },
              dropdownMenuEntries:
                  GenderLabel.values.map((gender) {
                    return DropdownMenuEntry<GenderLabel>(
                      value: gender,
                      label: gender.label,
                      style: MenuItemButton.styleFrom(
                        foregroundColor: AppColors.textColor,
                        backgroundColor: AppColors.secondaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    );
                  }).toList(),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStateProperty.all(
                  AppColors.secondaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
