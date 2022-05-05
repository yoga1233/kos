import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TipsCard extends StatelessWidget {
  final String imageUrl;
  final String tittle;
  final String updateAt;
  const TipsCard(
      {Key? key,
      required this.imageUrl,
      required this.tittle,
      required this.updateAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tittle,
                style: blackTextstyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                updateAt,
                style: greyTextStyle.copyWith(fontWeight: light),
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_right),
            color: greyColor,
          )
        ],
      ),
    );
  }
}
