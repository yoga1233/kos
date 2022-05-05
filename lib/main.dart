import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/page_cubit.dart';
import 'package:kos/cubit/space_cubit.dart';
import 'package:kos/ui/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => SpaceCubit(),
        )
      ],
      child: const MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
