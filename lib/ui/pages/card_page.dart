import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: const Center(
        child: Text('Card Page'),
      ),
    );
  }
}
