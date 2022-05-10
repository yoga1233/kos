import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/ui/pages/sign_in_page.dart';
import 'package:kos/ui/widget/custom_button.dart';

import '../../cubit/auth_cubit.dart';
import '../../cubit/page_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  get whiteColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: BlocConsumer<AuthCubit, AuthState>(
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
          return Center(
            child: CustomButton(
                width: double.infinity,
                text: 'LogOut',
                edgeInsets: const EdgeInsets.symmetric(horizontal: 24),
                onTap: () {
                  context.read<AuthCubit>().signOut();
                }),
          );
        },
      ),
    );
  }
}
