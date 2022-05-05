import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class FacilitiesItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;
  const FacilitiesItem(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 32,
          ),
          const SizedBox(
            height: 8,
          ),
          Text.rich(
            TextSpan(
                text: total.toString(),
                style: purpleTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
                children: [
                  TextSpan(
                      text: ' $name',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ))
                ]),
          ),
        ],
      ),
    );
  }
}
