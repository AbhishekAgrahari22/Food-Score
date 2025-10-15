import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF030213),
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.borderRadius = 8,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(text, style: TextStyle(fontSize: fontSize)),
      ),
    );
  }
}
