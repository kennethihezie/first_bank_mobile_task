import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeda_loan_app/ui/utils/color.dart';

/**
 * Created by collins ihezie on 19/04/23
 */

Widget customTextField({required TextEditingController controller,
  required String hint,
  Color? inactiveColor,
  bool? isPassword,
  bool? inputValidator,
  TextInputType? textInputType,
  bool? obscureText,
  bool? isEnabled,
  Function? callback,
  Function(String text)? onChange}) {
  print(isEnabled);
  return Container(
    padding: const EdgeInsets.only(),
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(16.0),
    //   color: SmartPayColors.aF9FAFB
    // ),
    child: TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: textInputType,
      enabled: isEnabled,
      onChanged: onChange,
      style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          decoration: TextDecoration.none,
          color: MobileAssessmentColors.A181212),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: MobileAssessmentColors.lightGrey, width: 1.5)
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: MobileAssessmentColors.lightGrey, width: 1.5)
        ),
        // filled: true,
        // fillColor: MobileAssessmentColors.A27AE60,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MobileAssessmentColors.A2B99FF, width: 1.5),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: MobileAssessmentColors.lightGrey,
            decoration: TextDecoration.none),
        suffixIcon: isPassword != null
            ? InkWell(
            onTap: () => {callback?.call()},
            child: isEnabled == true ?  Icon(
              obscureText == true
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.black,
              size: 20,
            ) : const Padding(padding: EdgeInsets.all(16), child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator.adaptive(strokeWidth: 2,),),))
            : null,
      ),
    ),
  );
}