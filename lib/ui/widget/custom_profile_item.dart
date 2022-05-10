import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomProfileItem extends StatelessWidget {
  final Widget child;
  final Function() function;
  const CustomProfileItem(
      {Key? key, required this.function, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
