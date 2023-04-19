import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeda_loan_app/ui/utils/color.dart';
import 'package:freeda_loan_app/ui/widgets/typography.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

class CustomButton extends StatelessWidget {
  final String title;
  Function callback;
  Color color;
  bool? isBusy;
  CustomButton({Key? key, required this.title, required this.callback, required this.color, this.isBusy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: isBusy == true ? MobileAssessmentColors.lightGrey : color
      ),

      child: Builder(
          builder: (context) {
            return InkWell(
              onTap: isBusy == true ? null : () => callback.call(),

              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(child: textHeading3(isBusy == true ? 'Checking...' : title, Colors.white)),
              ),
            );
          }
      ),
    );
  }
}
