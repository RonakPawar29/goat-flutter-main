import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;
  
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor = const Color(0xFFFF6500),
    this.textColor = Colors.white,
    this.width = 0.85,
    this.fontSize = 0.026,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      width: screenWidth * width,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
        ),
        child: isLoading
          ? SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(textColor),
              ),
            )
          : FittedBox(
              child: AutoSizeText(
                text,
                style: TextStyle(
                  fontSize: screenHeight * fontSize,
                  color: textColor,
                  fontWeight: fontWeight,
                ),
              ),
            ),
      ),
    );
  }
}