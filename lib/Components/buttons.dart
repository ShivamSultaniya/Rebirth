import 'package:flutter/material.dart';
import 'package:rebirth_draft_2/Components/app_colors.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ElevatedButtonCustom({
    super.key,
    this.title = 'Next',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: TextStyle(color: AppColors.backgroundColor, fontSize: 15),
        ),
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  final Color selectedButtonColor;
  final Color unselectedButtonColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const ChoiceButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onPressed,
    this.selectedButtonColor = Colors.white,
    this.unselectedButtonColor = const Color(0xFF212121),
    this.selectedTextColor = Colors.black,
    this.unselectedTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? selectedButtonColor : unselectedButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? selectedTextColor : unselectedTextColor,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
