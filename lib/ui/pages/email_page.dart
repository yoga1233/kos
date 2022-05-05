import 'package:flutter/material.dart';
import 'package:kos/shared/theme.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: const Center(
        child: Text('Email Page'),
      ),
    );
  }
}
