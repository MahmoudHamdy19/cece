
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/App Textstyle.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CustomText({
    required this.text,
    required this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

class CustomWidgetDisplay extends StatelessWidget {
  final String label;
  final String date;
    Icon? icon ;

    CustomWidgetDisplay({required this.label, required this.date,this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          icon??Icon(Icons.calendar_month),
          SizedBox(width: 10.0,), 
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$label: ",
                    style: AppTextStyles.w600.copyWith(
                      fontSize: 16,
                      color: AppColors.mediumGrey,
                      fontFamily: "PTSans",
                    ),
                  ),
                  TextSpan(
                    text: date,
                    style: AppTextStyles.w600.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                      fontFamily: "PTSans",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}