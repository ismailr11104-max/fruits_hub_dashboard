import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.onSaved,
    this.textInputAction,
    this.maxLines = 1,
  });

  final String hintText;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      onSaved: onSaved,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Color(0xffE6E9E9)),
    );
  }
}
