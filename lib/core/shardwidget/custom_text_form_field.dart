import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? preWidget;
  final Widget? sufWidget;
  final TextInputType type;
  final bool? obscure;
  final String? Function(String?) validtor;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      this.preWidget,
      this.sufWidget,
      required this.type,
      this.obscure,
      required this.validtor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validtor,
      decoration: InputDecoration(
        prefixIcon: preWidget,
        suffixIcon: sufWidget,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        hintText: label,
      ),
    );
  }
}
