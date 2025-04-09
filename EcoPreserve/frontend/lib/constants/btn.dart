import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/size.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BoxConstraints constraints;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = constraints.maxWidth >= minDesktopWidth;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 25.0 : 12.0,
          vertical: isDesktop ? 20.0 : 8.0,
        ),
        textStyle: isDesktop
            ? const TextStyle(fontSize: 15)
            : const TextStyle(fontSize: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              12.0), // Border radius for rectangular curve
          side: const BorderSide(
            color: CustomColor.greenSecondary, // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child:
          Text(text, style: const TextStyle(color: CustomColor.greenSecondary)),
    );
  }
}
