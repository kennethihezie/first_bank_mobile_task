import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeda_loan_app/ui/views/login/login.dart';

import '../../../di/di.dart';
import '../../bloc/login/login_cubit.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: 'images/logo.png',
          nextScreen: BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(DiContainer.getIt.get()),
              child: LoginPage()),
          splashIconSize: 120.0,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white),
    );
  }
}
