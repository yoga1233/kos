import 'package:flutter/material.dart';
import 'package:kos/shared/theme.dart';
import 'package:kos/ui/widget/custom_button.dart';
import 'package:kos/ui/widget/custom_text_form_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          )
        ],
      );
    }

    Widget googleSignIn() {
      return InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
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
                'SignIn With Google',
                style: greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              )
            ],
          ),
        ),
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
          const CustomTextFormField(
              hintText: 'Your email address', labelText: 'Email'),
          const CustomTextFormField(
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
                  onTap: () {},
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
          CustomButton(
              width: double.infinity,
              text: 'SignIn',
              edgeInsets: const EdgeInsets.only(
                top: 30,
                left: 24,
                right: 24,
              ),
              onTap: () {})
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [header(), googleSignIn(), or(), inputSection()],
      ),
    );
  }
}
