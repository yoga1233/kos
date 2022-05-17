import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/auth_cubit.dart';
import 'package:kos/shared/theme.dart';
import 'package:kos/ui/pages/main_page.dart';
import 'package:kos/ui/pages/sign_up_page.dart';
import 'package:kos/ui/widget/custom_button.dart';
import 'package:kos/ui/widget/custom_text_form_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: '');
    final TextEditingController passwordController =
        TextEditingController(text: '');

    Widget header() {
      return Column(
        children: [
          Image.asset(
            'assets/logo.png',
            width: 70,
            height: 70,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Cozy House',
            style: blackTextstyle.copyWith(fontSize: 24, fontWeight: bold),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Welcome Back!',
            style: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: light,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    }

    Widget googleSignIn() {
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
          return InkWell(
            onTap: () {
              context.read<AuthCubit>().signInGoogle(context: context);
            },
            child: Container(
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffDBD7EC)),
                  borderRadius: BorderRadius.circular(17)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_google_login.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Continue With Google',
                    style: greyTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    Widget or() {
      return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        child: Text(
          'Or',
          style: greyTextStyle.copyWith(fontSize: 14, fontWeight: regular),
        ),
      );
    }

    Widget inputSection() {
      return Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            hintText: 'Your email address',
            labelText: 'Email',
          ),
          CustomTextFormField(
            controller: passwordController,
            hintText: 'Your password',
            labelText: 'Password',
            obsecureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ));
                  },
                  child: Text(
                    'Dont have an account?',
                    style: greyTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot password?',
                    style: greyTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: light,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget loginButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
                (route) => false);
          }
          if (state is AuthFailedSignIn) {
            print('eror sign in');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.blueAccent,
                content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {}
          return CustomButton(
              width: double.infinity,
              text: 'Login',
              edgeInsets: const EdgeInsets.only(
                top: 30,
                left: 24,
                right: 24,
              ),
              onTap: () {
                context.read<AuthCubit>().signIn(
                    email: emailController.text,
                    password: passwordController.text);
              });
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          header(),
          googleSignIn(),
          or(),
          inputSection(),
          loginButton(),
        ],
      ),
    );
  }
}
