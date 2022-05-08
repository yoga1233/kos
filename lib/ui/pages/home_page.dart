import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:kos/cubit/auth_cubit.dart';
import 'package:kos/cubit/google_auth_cubit.dart';
import 'package:kos/cubit/space_cubit.dart';
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
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    context.read<AuthCubit>().getCurrentUser(auth.currentUser!.uid);
    context.read<SpaceCubit>().fetchSpace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 50, left: 24, right: 24),
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
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                print('state auth pada home page = $state');
                if (state is AuthSuccess) {
                  return Text(
                    state.user.name,
                    style: blackTextstyle.copyWith(
                      fontSize: 24,
                      fontWeight: medium,
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
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

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            popularCities(),
            BlocBuilder<SpaceCubit, SpaceState>(
              builder: (context, state) {
                if (state is SpaceSuccess) {
                  return recomendedSpace(state.space);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            tips(),
          ],
        ),
      ),
    );

    // return BlocConsumer<SpaceCubit, SpaceState>(
    //   listener: (context, state) {
    //     if (state is SpaceFailed) {
    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         content: Text(state.eror),
    //         backgroundColor: Colors.amber,
    //       ));
    //     }
    //   },
    //   builder: (context, state) {
    //     if (state is SpaceSuccess) {
    //       return Scaffold(
    //         backgroundColor: whiteColor,
    //         body: SingleChildScrollView(
    //           child: Column(
    //             children: [
    //               header(),
    //               popularCities(),
    //               recomendedSpace(state.space),
    //               tips(),
    //             ],
    //           ),
    //         ),
    //       );
    //     }
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
  }
}
