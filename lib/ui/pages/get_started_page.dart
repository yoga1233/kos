import 'package:flutter/material.dart';
import 'package:kos/shared/theme.dart';
import 'package:kos/ui/pages/sign_in_page.dart';
import 'package:kos/ui/widget/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 433,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/splash_image.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Find Cozy House\nto Stay and Happy',
                  style:
                      blackTextstyle.copyWith(fontSize: 24, fontWeight: medium),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                  style:
                      greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                ),
                CustomButton(
                  width: 210,
                  text: 'Explore Now',
                  edgeInsets: const EdgeInsets.only(top: 40),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
