import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class PopularCityCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool isPopular;
  const PopularCityCard(
      {Key? key,
      required this.imageUrl,
      required this.text,
      this.isPopular = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const DetailPage(),
        //     ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          height: 150,
          width: 120,
          color: const Color(0xffF6F7F8),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(17),
                        topRight: Radius.circular(17)),
                    child: Image.asset(
                      imageUrl,
                      width: 120,
                      height: 102,
                    ),
                  ),
                  isPopular
                      ? Align(
                          alignment: Alignment.topRight,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(17)),
                            child: Container(
                              height: 30,
                              width: 50,
                              color: primaryColor,
                              child: Center(
                                child: Image.asset(
                                  'assets/icon_star.png',
                                  width: 22,
                                  height: 22,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                text,
                style: blackTextstyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
