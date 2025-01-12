import 'package:flutter/material.dart';

class MyCustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String?)? onSubmit;

  const MyCustomTextFormField(
      {super.key, required this.hintText, this.onSubmit, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Add The Amount";
          } else {
            return null;
          }
        },
        onSaved: onSubmit,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),

          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          hintText: hintText,
        ),
        // keyboardType: TextInputType.number,
      ),
    );
  }
}
