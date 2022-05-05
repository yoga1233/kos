import 'package:flutter/material.dart';
import 'package:kos/model/space_model.dart';
import 'package:kos/shared/theme.dart';

import 'package:kos/ui/widget/custom_button.dart';
import 'package:kos/ui/widget/facilities_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/rating_item.dart';

class DetailPage extends StatefulWidget {
  final SpaceModel space;
  const DetailPage(this.space, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    Widget headerImage() {
      return Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.space.imageUrl), fit: BoxFit.cover),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 328),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE : TITTLE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.space.name.toString(),
                      style: blackTextstyle.copyWith(
                        fontSize: 22,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text.rich(
                      TextSpan(
                          text: '\$${widget.space.price}',
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
                  ],
                ),
                Row(
                  children: [1, 2, 3, 4, 5].map((index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        left: 2,
                      ),
                      child: RatingItem(
                        index: index,
                        rating: widget.space.rating,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            // NOTE : MAIN FACILLITIES
            const SizedBox(
              height: 30,
            ),
            Text(
              'Main Facilities',
              style: blackTextstyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                FacilitiesItem(
                  name: 'Kitchen',
                  total: widget.space.numberOfKitchens,
                  imageUrl: 'assets/icon_kitchen.png',
                ),
                FacilitiesItem(
                  name: 'Bedroom',
                  total: widget.space.numberOfBedrooms,
                  imageUrl: 'assets/icon_bedroom.png',
                ),
                FacilitiesItem(
                  name: 'Big Lemari',
                  total: widget.space.numberOfCupboards,
                  imageUrl: 'assets/icon_cupboard.png',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //NOTE:PHOTOS
            Text(
              'Photos',
              style: blackTextstyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.space.photos.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(right: 18),
                    width: 110,
                    height: 88,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        image: DecorationImage(
                            image: NetworkImage(item), fit: BoxFit.cover)),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // NOTE: LOCATION
            Text(
              'Location',
              style: blackTextstyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  '${widget.space.address}\n${widget.space.city}',
                  style: greyTextStyle,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(widget.space.mapUrl),
                          mode: LaunchMode.externalApplication);
                    },
                    icon: Image.asset(
                      'assets/btn_map.png',
                      width: 40,
                    ))
              ],
            ),
            CustomButton(
              width: double.infinity,
              text: 'Book Now',
              edgeInsets: const EdgeInsets.only(top: 40),
              onTap: () {},
            ),
          ],
        ),
      );
    }

    Widget backAndFav() {
      return Container(
        margin: const EdgeInsets.only(
          top: 50,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/btn_back.png',
                width: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Image.asset(
                isFavorite
                    ? 'assets/btn_wishlist.png'
                    : 'assets/btn_wishlist_active.png',
                width: 40,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          headerImage(),
          SingleChildScrollView(
            child: Column(
              children: [content()],
            ),
          ),
          backAndFav()
        ],
      ),
    );
  }
}
