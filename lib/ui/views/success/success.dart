import 'package:first_bank/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeda_loan_app/ui/widgets/custom_button.dart';
import 'package:freeda_loan_app/ui/widgets/typography.dart';
import 'package:lottie/lottie.dart';
import '../../utils/color.dart';
import '../../widgets/app_bar.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class SuccessPage extends StatelessWidget {
  final User? user;
  const SuccessPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MobileAssessmentColors.background,
      appBar: customAppBar(
        title: "Loan Success",
        isActionEnabled: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Center(child: textHeading3('${user?.firstName} ${user?.lastName}', MobileAssessmentColors.lightGrey)),

            const Padding(padding: EdgeInsets.only(top: 24)),

            Center(child: textHeading5('₦500,000', MobileAssessmentColors.A181212)),

            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07)),

            Lottie.asset('images/success.json'),

            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07)),

            CustomButton(title: 'SUBMIT', callback: () => {}, color: MobileAssessmentColors.A0085FF)
          ],
        ),
      ),
    );
  }
}
