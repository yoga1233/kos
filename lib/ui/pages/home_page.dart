import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/space_cubit.dart';
import 'package:kos/model/google_auth_model.dart';
import 'package:kos/model/space_model.dart';
import 'package:kos/shared/theme.dart';
import 'package:kos/ui/widget/city_card.dart';
import 'package:kos/ui/widget/recomended_card.dart';
import 'package:kos/ui/widget/tips_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<SpaceCubit>().fetchSpace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 24, left: 24),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Now',
                    style: blackTextstyle.copyWith(
                        fontSize: 24, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Mencari kosan yang cozy',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Mencari kosan yang cozy',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            )
          ],
        ),
      );
    }

    Widget popularCities() {
      return Container(
        margin: const EdgeInsets.only(top: 30, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Cities',
              style: blackTextstyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  PopularCityCard(
                    imageUrl: 'assets/city1.png',
                    text: 'jakarta',
                  ),
                  PopularCityCard(
                    imageUrl: 'assets/city2.png',
                    text: 'Surabaya',
                    isPopular: true,
                  ),
                  PopularCityCard(
                    imageUrl: 'assets/city3.png',
                    text: 'Bandung',
                  ),
                  PopularCityCard(
                    imageUrl: 'assets/city4.png',
                    text: 'Aceh',
                    isPopular: true,
                  ),
                  PopularCityCard(
                    imageUrl: 'assets/city5.png',
                    text: 'Bogor',
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget recomendedSpace(List<SpaceModel> space) {
      return Container(
        margin: const EdgeInsets.only(top: 30, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended Space',
              style: blackTextstyle.copyWith(fontSize: 16),
            ),
            Column(
              children: space.map((SpaceModel space) {
                return RecomendedCard(space);
              }).toList(),
            ),
          ],
        ),
      );
    }

    Widget tips() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 30,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tips & Guidance',
              style: blackTextstyle.copyWith(fontSize: 16),
            ),
            const TipsCard(
              imageUrl: 'assets/tips1.png',
              tittle: 'City Guidelines',
              updateAt: 'Updated 20 Apr',
            ),
            const TipsCard(
              imageUrl: 'assets/tips2.png',
              tittle: 'City Guidelines',
              updateAt: 'Updated 20 Apr',
            ),
            const SizedBox(
              height: 110,
            )
          ],
        ),
      );
    }

    return BlocConsumer<SpaceCubit, SpaceState>(
      listener: (context, state) {
        if (state is SpaceFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.eror),
            backgroundColor: Colors.amber,
          ));
        }
      },
      builder: (context, state) {
        if (state is SpaceSuccess) {
          return Scaffold(
            backgroundColor: whiteColor,
            body: ListView(
              children: [
                header(),
                popularCities(),
                recomendedSpace(state.space),
                tips(),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
