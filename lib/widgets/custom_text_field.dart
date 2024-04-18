import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormTextFaild extends StatelessWidget {
  CustomFormTextFaild(
      {this.onChanged, this.hintText, this.obscureText = false});
  Function(String)? onChanged;

  String? hintText;

  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      // ignore: body_might_complete_normally_nullable
      validator: (data) {
        if (data!.isEmpty) {
          return ' Please enter the value';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: BorderRadius.all(Radius.circular(11)),
        ),
//
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: BorderRadius.all(Radius.circular(11)),
        ),
//
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: BorderRadius.all(Radius.circular(11)),
        ),
      ),
    );
  }
}
