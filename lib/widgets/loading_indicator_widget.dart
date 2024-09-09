import 'package:api_assignment/extensions/screen_size.dart';
import 'package:api_assignment/ui_constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final String text;
  const LoadingIndicatorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(color: secondaryColor.withOpacity(0.3), borderRadius: BorderRadius.circular(15)),
        width: context.getWidth(divideBy: 2),
        height: context.getHeight(divideBy: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: mainColor),
            const SizedBox(height: 20),
            Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: mainColor))
          ],
        ),
      ),
    );
  }
}