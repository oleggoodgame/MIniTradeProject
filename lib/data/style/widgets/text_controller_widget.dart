import 'package:flutter/material.dart';
import 'package:mini_cash/data/style/style.dart';

class TextControllerWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscure;
  final String? errorText;
  final String? Function(String?)? validator;

  const TextControllerWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscure = false,
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(kSmall)),
        ),
        prefixIcon: Icon(icon),
        errorText: errorText, 
      ),
    );
  }
}
