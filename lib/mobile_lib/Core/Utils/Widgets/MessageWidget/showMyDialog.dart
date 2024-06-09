import 'package:flutter/cupertino.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../App Colors.dart';
import '../../App Textstyle.dart';


void showMyDialog({required BuildContext context, required Function()? ontap, required String message}) async {
  return await AwesomeDialog(
    context: context,
    dialogType: DialogType.info,

    animType: AnimType.rightSlide,
    title:message ,
    titleTextStyle: AppTextStyles.bold.copyWith(fontSize: 18),
    descTextStyle:AppTextStyles.w300.copyWith(fontSize: 18),
    desc: ' Are you sure you want $message ?',
    btnCancelText: "No",


    btnCancelOnPress: (){},
    btnOkText: "Yes",
    btnOkColor: AppColors.primaryColor,
    btnOkOnPress: ontap,
  ).show();
}
