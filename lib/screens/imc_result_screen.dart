import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_home_screen.dart';

class ImcResultScreen extends StatelessWidget {
  final String? selectedGender;
  final double selectedHeight;
  final int selectedWeight;
  final int selectedAge;

  const ImcResultScreen({
    super.key,
    required this.selectedGender,
    required this.selectedHeight,
    required this.selectedWeight,
    required this.selectedAge,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolBarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = selectedHeight / 100;
    double result = selectedWeight / (fixedHeight * fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Resultado",
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 32,
                left: 16,
                right: 16,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getTitleIMC(result),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getColorIMC(result),
                        fontSize: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        getDescriptionIMC(result),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => ImcHomeScreen()),
              );
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
            ),
            child: Text("Finalizar", style: TextStyles.bodyText),
          ),
          /*Text(selectedGender.toString(), style: TextStyles.bodyText),
          Text(selectedHeight.toStringAsFixed(0), style: TextStyles.bodyText),
          Text(selectedWeight.toString(), style: TextStyles.bodyText),
          Text(selectedAge.toString(), style: TextStyles.bodyText),*/
        ],
      ),
    );
  }

  Color getColorIMC(double result) {
    return switch (result) {
      < 18.5 => Colors.blue, // IMC Bajo
      < 24.9 => Colors.green, // IMC Normal
      < 29.9 => Colors.orange, // IMC Sobrepeso
      _ => Colors.red, // IMC Obesidad
    };
  }

  String getTitleIMC(double result) {
    return switch (result) {
      < 18.5 => "IMC Bajo",
      < 24.9 => "IMC Normal",
      < 29.9 => "IMC Sobrepeso",
      _ => "IMC Obesidad",
    };
  }

  String getDescriptionIMC(double result) {
    return switch (result) {
      < 18.5 => "Tu peso esta por debajo de lo recomendado.",
      < 24.9 => "Tu peso esta en el rango normal.",
      < 29.9 => "Estas en sobrepeso, cuida tu alimentación.",
      _ => "Tienes Obesidad, busca un especialista.",
    };
  }

  AppBar toolBarResult() {
    return AppBar(
      title: Text("Resultado IMC"),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }
}
