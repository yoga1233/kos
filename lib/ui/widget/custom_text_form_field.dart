import 'package:flutter/material.dart';
import 'package:kos/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obsecureText;
  const CustomTextFormField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.obsecureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 10,
      ),
      child: TextFormField(
        obscureText: obsecureText,
        decoration: InputDecoration(
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
