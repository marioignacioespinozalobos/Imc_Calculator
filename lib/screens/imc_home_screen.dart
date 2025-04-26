import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 10;
  int selectedWeight = 50;
  double selectedHeight = 160;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(
          selectedGender: selectedGender,
          onGenderSelected: (gener) {
            setState(() {
              selectedGender = gener;
            });
          },
        ),
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChanged: (newHeigth) {
            setState(() {
              selectedHeight = newHeigth;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "Peso",
                  number: selectedWeight,
                  onDecrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: "Edad",
                  number: selectedAge,
                  onDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 30,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ImcResultScreen(
                          selectedGender: selectedGender,
                          selectedHeight: selectedHeight,
                          selectedWeight: selectedWeight,
                          selectedAge: selectedAge,
                        ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  AppColors.primaryColor,
                ),
              ),
              child: Text("Calcular IMC", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
