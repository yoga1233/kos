import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/auth_cubit.dart';
import 'package:kos/shared/theme.dart';
import 'package:kos/ui/pages/get_started_page.dart';
import 'package:kos/ui/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const GetStartedPage(),
            ),
            (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
            (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Find Cozy House\nto Stay and Happy',
              textAlign: TextAlign.center,
              style:
                  whiteTextStyle.copyWith(fontSize: 45, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Stop membuang banyak waktu\npada tempat yang tidak habitable',
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: light),
            ),
          ],
        ),
      ),
    );
  }
}
