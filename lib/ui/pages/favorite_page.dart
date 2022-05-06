import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/google_auth_cubit.dart';
import 'package:kos/ui/pages/signin_page.dart';
import 'package:kos/ui/widget/custom_button.dart';

import '../../cubit/page_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  get whiteColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
        listener: (context, state) {
          if (state is GoogleAuthFailled) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.eror),
              backgroundColor: Colors.amber,
            ));
          } else if (state is GoogleAuthInitial) {
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
          if (state is GoogleAuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: CustomButton(
                width: double.infinity,
                text: 'LogOut',
                edgeInsets: const EdgeInsets.symmetric(horizontal: 24),
                onTap: () {
                  context.read<GoogleAuthCubit>().signOut();
                }),
          );
        },
      ),
    );
  }
}
