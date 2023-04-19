import 'package:first_bank/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeda_loan_app/app/routes.dart';
import 'package:freeda_loan_app/ui/bloc/home/home_cubit.dart';
import 'package:freeda_loan_app/ui/bloc/login/login_cubit.dart';
import 'package:freeda_loan_app/ui/views/home/home.dart';
import 'package:freeda_loan_app/ui/views/login/login.dart';
import 'package:freeda_loan_app/ui/views/splash_screen/spash_screen.dart';
import 'package:freeda_loan_app/ui/views/success/success.dart';
import 'package:go_router/go_router.dart';
import '../di/di.dart';


/**
 * Created by collins ihezie on 19/04/23
 */

class MobileAssessmentRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: MobileAssessmentRoutes.splashScreen,
        builder: (context, state) => const SplashScreen()),

    GoRoute(
        path: MobileAssessmentRoutes.login,
        builder: (context, state) => BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(DiContainer.getIt.get()),
            child: LoginPage())),

    GoRoute(
        path: MobileAssessmentRoutes.home,
        builder: (context, state) => BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
            child: Home(
              user: state.extra as User?,
            ))),

    GoRoute(
        path: MobileAssessmentRoutes.successPage,
        builder: (context, state) => SuccessPage(user: state.extra as User?,)),
  ]);
}
