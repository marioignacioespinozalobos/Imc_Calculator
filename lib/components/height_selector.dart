import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChanged;

  const HeightSelector({
    super.key,
    required this.selectedHeight,
    required this.onHeightChanged,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("ALTURA", style: TextStyles.bodyText),
            ),
            Text(
              "${widget.selectedHeight.toStringAsFixed(0)} cm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: widget.selectedHeight,
              onChanged: (newHeight) {
                setState(() {
                  widget.onHeightChanged(newHeight);
                });
              },
              min: 150,
              max: 220,
              divisions: 70,
              label: "${widget.selectedHeight.toStringAsFixed(0)} cm",
              activeColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
