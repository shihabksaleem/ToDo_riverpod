import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final String hint;

  const CustomTextformfield({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).cardTheme.color,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      ),
    );
  }
}
