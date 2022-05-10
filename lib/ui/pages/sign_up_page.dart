import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/auth_cubit.dart';
import 'package:kos/shared/theme.dart';
import 'package:kos/ui/widget/custom_button.dart';
import 'package:kos/ui/widget/custom_text_form_field.dart';

import 'main_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String erorMessage = '';
    final TextEditingController emailController =
        TextEditingController(text: '');
    final TextEditingController nameController =
        TextEditingController(text: '');
    final TextEditingController passwordController =
        TextEditingController(text: '');
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Register Account',
              style: blackTextstyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Create your account',
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
              ),
            )
          ],
        ),
      );
    }

    Widget inputSection() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            CustomTextFormField(
              controller: nameController,
              labelText: 'Name',
              hintText: 'Youre name',
            ),
            CustomTextFormField(
              controller: emailController,
              labelText: 'Email',
              hintText: 'youre email address',
              helperText: erorMessage,
            ),
            CustomTextFormField(
              controller: passwordController,
              labelText: 'Password',
              hintText: 'password',
              obsecureText: true,
            )
          ],
        ),
      );
    }

    Widget registerButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.blueAccent,
                content: Text(state.error)));
          } else if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {}
          return CustomButton(
              width: double.infinity,
              text: 'Register',
              edgeInsets: const EdgeInsets.only(top: 20, right: 24, left: 24),
              onTap: () {
                context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text);
              });
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          header(),
          inputSection(),
          registerButton(),
        ],
      ),
    );
  }
}
