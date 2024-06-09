import 'package:cece/core/app_export.dart';
import 'package:cece/mobile_lib/Core/Utils/App%20Colors.dart';
import 'package:flutter/material.dart';
  import 'forward_button.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function() onTap;
  final String? value;
  const SettingItem({
     required this.title,
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title, style: AppTextStyles.lrTitles.copyWith(
              fontSize: 18,
              color: AppColors.black
          )
          ),
          const Spacer(),
          value != null
              ? Text(
                  value!,
              style: AppTextStyles.w600.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black
              )
                )
              : const SizedBox(),
          const SizedBox(width: 20),
          ForwardButton(
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
