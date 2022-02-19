import 'package:flutter/material.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(color: Color.fromARGB(255, 91, 33, 29)),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color.fromARGB(255, 220, 160, 160)),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
