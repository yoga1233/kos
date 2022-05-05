import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String text;
  final EdgeInsets edgeInsets;
  final Function() onTap;
  const CustomButton(
      {Key? key,
      required this.width,
      required this.text,
      required this.edgeInsets,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: edgeInsets,
        width: width,
        height: 50,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(17)),
        child: Center(
            child: Text(
          text,
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        )),
      ),
    );
  }
}
