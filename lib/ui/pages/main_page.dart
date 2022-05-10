import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/page_cubit.dart';
import 'package:kos/ui/pages/card_page.dart';
import 'package:kos/ui/pages/email_page.dart';
import 'package:kos/ui/pages/favorite_page.dart';
import 'package:kos/ui/pages/home_page.dart';
import 'package:kos/ui/pages/profile_page.dart';
import 'package:kos/ui/widget/custom_bottom_navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const EmailPage();
        case 2:
          return const CardPage();
        case 3:
          return const FavoritePage();
        case 4:
          return const ProfilePage();

        default:
          return const HomePage();
      }
    }

    Widget bottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: 65,
            width: double.infinity,
            margin: const EdgeInsets.only(
              bottom: 30,
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: const Color(0xffF6F7F8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomBottomNavigation(
                  imageUrl: 'assets/icon_home.png',
                  index: 0,
                ),
                CustomBottomNavigation(
                  imageUrl: 'assets/icon_email.png',
                  index: 1,
                ),
                CustomBottomNavigation(
                  imageUrl: 'assets/icon_card.png',
                  index: 2,
                ),
                CustomBottomNavigation(
                  imageUrl: 'assets/icon_love.png',
                  index: 3,
                ),
                CustomBottomNavigation(
                  imageUrl: 'assets/icon_profile.png',
                  index: 4,
                )
              ],
            )),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(currentIndex),
              bottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
