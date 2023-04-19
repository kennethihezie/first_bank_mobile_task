import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeda_loan_app/ui/bloc/login/login_cubit.dart';
import 'package:freeda_loan_app/ui/utils/color.dart';
import 'package:freeda_loan_app/ui/utils/notification.dart';
import 'package:freeda_loan_app/ui/widgets/typography.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routes.dart';
import '../../widgets/custom_input_field.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();
  bool _obscureText = false;
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.status) {
            case LoginStatus.loading:
              isEnabled = false;
              break;

            case LoginStatus.success:
              Future.delayed(const Duration(), () {
                AppNotification.success(
                    message: 'Logged in successfully', context: context);
                context.go(MobileAssessmentRoutes.home, extra: state.user);
              });
              break;

            case LoginStatus.failure:
              Future.delayed(const Duration(), () {
                AppNotification.error(message: 'Invalid customer id.', context: context);
                isEnabled = true;
                _controller.clear();
              });
              context.read<LoginCubit>().emit(state.copyWith(status: LoginStatus.initial));
              break;

            default:
          }

          return Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(24)),
                textHeading5('Hi There! 👋', MobileAssessmentColors.A181212),
                const Padding(padding: EdgeInsets.all(8)),
                textSemiRegular('Welcome back, Sign in to your account',
                    MobileAssessmentColors.A181212),
                const Padding(padding: EdgeInsets.all(24)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextField(
                        controller: _controller,
                        hint: "Enter your customer id",
                        isPassword: true,
                        obscureText: _obscureText,
                        isEnabled: isEnabled,
                        textInputType: TextInputType.number,
                        callback: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        onChange: (value) {
                          if (value.length == 8) {
                            context
                                .read<LoginCubit>()
                                .loginUser(customerId: int.parse(value));
                            // setState(() {
                            //   _isEnabled = !_isEnabled;
                            // });
                          }
                        }),
                  ],
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
