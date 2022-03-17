import 'package:auth_mega_lesson/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key? key,
    required this.controller,
    required this.maxLength,
    required this.onChange,
    required this.title,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChange;
  final String title;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      onChanged: onChange,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: title,
        counterText: '',
        counter: null,
        border: OutlineInputBorder(
          borderRadius: AppTheme.br,
          borderSide: const BorderSide(width: 2),
        ),
      ),
    );
  }
}
