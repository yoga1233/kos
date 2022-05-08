import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kos/cubit/auth_cubit.dart';
import 'package:kos/cubit/google_auth_cubit.dart';
import 'package:kos/cubit/page_cubit.dart';
import 'package:kos/cubit/space_cubit.dart';
import 'package:kos/ui/pages/favorite_page.dart';
import 'package:kos/ui/pages/signin_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:kos/ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ),
        BlocProvider(
          create: (context) => GoogleAuthCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
