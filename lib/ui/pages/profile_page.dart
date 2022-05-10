import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/auth_cubit.dart';
import 'package:kos/shared/theme.dart';
import 'package:kos/ui/pages/sign_in_page.dart';
import 'package:kos/ui/widget/custom_profile_item.dart';

import '../../cubit/page_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    Widget background() {
      return Container(
        width: double.infinity,
        height: 350,
        color: primaryColor,
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 328,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            CustomProfileItem(
              child: Text(
                'Account',
                style:
                    blackTextstyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              function: () {},
            ),
            CustomProfileItem(
              child: Text(
                'Payment Method',
                style:
                    blackTextstyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              function: () {},
            ),
            CustomProfileItem(
              child: Text(
                'Help',
                style:
                    blackTextstyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              function: () {},
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.amber,
                  ));
                } else if (state is AuthInitial) {
                  context.read<PageCubit>().setPage(0);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                      (route) => false);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomProfileItem(
                  child: Text(
                    'Sign Out',
                    style:
                        redTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                  ),
                  function: () {
                    context.read<AuthCubit>().signOut();
                  },
                );
              },
            ),
          ],
        ),
      );
    }

    Widget profile() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        margin: const EdgeInsets.only(
          top: 120,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(user!.photoURL.toString()),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.displayName.toString(),
                  style:
                      whiteTextStyle.copyWith(fontSize: 30, fontWeight: medium),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  user.email.toString(),
                  style: whiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            background(),
            Column(
              children: [content()],
            ),
            profile()
          ],
        ));
  }
}
