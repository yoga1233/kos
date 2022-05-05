import 'package:flutter/material.dart';
import 'package:kos/model/space_model.dart';
import 'package:kos/ui/pages/detail_page.dart';

import '../../shared/theme.dart';

class RecomendedCard extends StatelessWidget {
  final SpaceModel space;
  const RecomendedCard(
    this.space, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(space),
            ));
      },
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            width: 130,
            height: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl.toString(),
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          topRight: Radius.circular(17)),
                      child: Container(
                        height: 30,
                        width: 70,
                        color: primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: whiteTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: medium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space.name.toString(),
                  style: blackTextstyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text.rich(
                  TextSpan(
                      text: '\$${space.price}',
                      style: purpleTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                      children: [
                        TextSpan(
                            text: ' / month',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ))
                      ]),
                ),
                const Spacer(),
                Text(
                  ' ${space.city}, ${space.country}',
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
