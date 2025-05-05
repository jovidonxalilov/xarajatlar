import 'package:exspenses/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.turi, required this.hintText,
  });

  final String hintText;

  final TextEditingController turi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: TextFormField(
        controller: turi,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.hintText,
                fontSize: 15,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
