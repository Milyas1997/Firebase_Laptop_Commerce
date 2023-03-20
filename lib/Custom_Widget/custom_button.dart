import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String buttonText;

 const CustomButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
