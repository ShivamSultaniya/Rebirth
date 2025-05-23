// import 'package:flutter/material.dart';
// import 'package:rebirth_draft_2/Components/app_colors.dart';
// import 'package:rebirth_draft_2/Components/buttons.dart'; // Your ElevatedButtonCustom

// class QualitiesToBuild extends StatefulWidget {
//   const QualitiesToBuild({super.key});

//   @override
//   State<QualitiesToBuild> createState() => _QualitiesToBuildState();
// }

// class _QualitiesToBuildState extends State<QualitiesToBuild> {
//   final List<String> qualities = [
//     "Courage",
//     "Discipline",
//     "Resilience",
//     "Kindness",
//     "Focus",
//     "Empathy",
//     "Gratitude",
//     "Confidence",
//     "Integrity",
//     "Creativity",
//     "Patience",
//     "Curiosity",
//     "Optimism",
//     "Humility",
//     "Persistence",
//     "Adaptability",
//     "Self-awareness",
//     "Vision",
//     "Responsibility",
//     "Ambition",
//   ];

//   late List<bool> _selected;

//   @override
//   void initState() {
//     super.initState();
//     _selected = List.filled(qualities.length, false);
//   }

//   void _toggleAllSelections() {
//     final allSelected = _selected.every((s) => s);
//     setState(() {
//       _selected = List.filled(qualities.length, !allSelected);
//     });
//   }

//   void _toggleSelection(int index) {
//     setState(() {
//       _selected[index] = !_selected[index];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 90),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Qualities To Build",
//               style: TextStyle(
//                 color: AppColors.textColor,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 2.0,
//               ),
//             ),

//             const SizedBox(height: 20),
//             TextField(
//               maxLines: 5,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: AppColors.secondaryColor,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//                 hintText: 'Type here...',
//                 hintStyle: TextStyle(color: AppColors.hintColor),
//               ),
//               style: TextStyle(color: AppColors.textColor),
//             ),

//             const SizedBox(height: 30),

//             ElevatedButtonCustom(
//               onPressed: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => const QualitiesToBuild(),
//                 //   ),
//                 // );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:rebirth_draft_2/Components/app_colors.dart';
import 'package:rebirth_draft_2/Components/buttons.dart';
import 'package:rebirth_draft_2/pages/OnBoarding/negative_habits.dart';

class QualitiesToBuild extends StatelessWidget {
  const QualitiesToBuild({super.key});

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
                "Qualities To Build",

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
                  hintText: 'Courage, Resilience...',
                  hintStyle: TextStyle(color: AppColors.hintColor),
                ),
                style: TextStyle(color: AppColors.textColor),
              ),
              SizedBox(height: 425),
              ElevatedButtonCustom(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NegativeHabits(),
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
