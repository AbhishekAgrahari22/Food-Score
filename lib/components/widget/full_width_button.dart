import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Icon? icon;
  final Icon? navigateIcon;
  const FullWidthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.borderRadius = 12,
    this.padding,
    this.icon,
    this.navigateIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // full width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (icon != null) ...[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(230, 230, 230, 1),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: icon!,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              if (navigateIcon != null) ...[
                const SizedBox(width: 8),
                navigateIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
