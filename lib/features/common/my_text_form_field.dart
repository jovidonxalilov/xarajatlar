import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? labelText;
  final bool hideText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const MyTextFormField({
    super.key,
    this.labelText,
    this.controller,
    this.hideText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
      ),
      validator: validator,
    );
  }
}
