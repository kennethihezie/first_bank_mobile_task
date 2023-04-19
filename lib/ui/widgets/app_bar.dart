import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeda_loan_app/ui/widgets/typography.dart';
import '../utils/color.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

PreferredSizeWidget customAppBar({required String title, required bool isActionEnabled, bool? isHome, Function? callback}) {
  return AppBar(
    title: textSemiBold(title, MobileAssessmentColors.A181212),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 1,
    actions: isActionEnabled ? const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.more_vert),
      )


    ] : isHome == true ? [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => callback?.call(),
          child: const Icon(Icons.logout),
        ),
      )
    ] : null,
    actionsIconTheme: const IconThemeData(color: MobileAssessmentColors.A181212),
    iconTheme: const IconThemeData(color: MobileAssessmentColors.A181212),
  );
}

//
