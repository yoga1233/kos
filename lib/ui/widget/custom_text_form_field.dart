import 'package:flutter/material.dart';
import 'package:kos/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  const CustomTextFormField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.obsecureText = false,
      required this.controller,
      this.helperText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 10,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          helperText: helperText,
          hintText: hintText,
          hintStyle: greyTextStyle,
          labelText: '$labelText : ',
          labelStyle: greyTextStyle,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
        ),
      ),
    );
  }
}
