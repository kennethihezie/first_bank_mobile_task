import 'package:first_bank/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeda_loan_app/ui/bloc/home/home_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routes.dart';
import '../../utils/color.dart';
import '../../utils/notification.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/typography.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class Home extends StatefulWidget {
  Home({Key? key, this.user}) : super(key: key);
  User? user;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user;
  bool _isBusy = false;

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobileAssessmentColors.background,
      appBar: customAppBar(
        title: "User Details",
        isActionEnabled: false,
        isHome: true,
        callback: () => context.go(MobileAssessmentRoutes.login)
      ),

      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state){},
        builder: (context, state){
          switch(state.status){
            case HomeStatus.checking:
              _isBusy = true;
              break;

            case HomeStatus.success:
              Future.delayed(const Duration(), () {
                context.push(MobileAssessmentRoutes.successPage, extra: user);
                // AppNotification.success(message: 'You are eligible for a loan', context: context);
                _isBusy = false;
                context.read<HomeCubit>().emit(state.copyWith(status: HomeStatus.initial));
              });
              break;

            case HomeStatus.failure:
              Future.delayed(const Duration(), () {
                AppNotification.error(
                    message: 'You are not eligible.', context: context);
                _isBusy = false;
              });
              break;

            default:
          }

          return Container(
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(minRadius: 50.0, backgroundColor: MobileAssessmentColors.A0085FF, child: textHeading4("${user?.firstName?.substring(0, 1)}${user?.lastName?.substring(0, 1)}", Colors.white),),

                        const Padding(padding: EdgeInsets.all(24)),

                        textHeading3("${user?.firstName} ${user?.lastName}", MobileAssessmentColors.A181212),

                        const Padding(padding: EdgeInsets.all(6)),

                        textMiniMiniMedium("${user?.customerId}", MobileAssessmentColors.A181212),

                        const Padding(padding: EdgeInsets.all(16)),
                      ],
                    ),

                    const Padding(padding: EdgeInsets.all(16)),

                    textHeading3("Basic Information", MobileAssessmentColors.A181212),

                    const Padding(padding: EdgeInsets.all(4)),

                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textMiniTextRegular("FullName", MobileAssessmentColors.A181212),

                                textSemiBold("${user?.firstName} ${user?.lastName}", MobileAssessmentColors.A181212),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textMiniTextRegular("Date of birth", MobileAssessmentColors.A181212),

                                textSemiBold("${user?.customerDob}", MobileAssessmentColors.A181212),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textMiniTextRegular("Bvn match", MobileAssessmentColors.A181212),

                                textSemiBold("${user?.bvnMatch}", MobileAssessmentColors.A181212),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textMiniTextRegular("Delinquent loans", MobileAssessmentColors.A181212),

                                textSemiBold("${user?.delinquentLoans}", MobileAssessmentColors.A181212),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),


                    const Padding(padding: EdgeInsets.all(4)),

                    CustomButton(title: 'Check loan eligibility', color: MobileAssessmentColors.A0085FF, isBusy: _isBusy, callback: (){
                      context.read<HomeCubit>().checkLoadEligibility(user!);
                    },)
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}