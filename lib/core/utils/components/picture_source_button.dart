
 import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/color_constant.dart';
import 'package:flutter/material.dart';
 import 'package:dotted_border/dotted_border.dart';


class PictureSourceButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const PictureSourceButton({
     required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeCap: StrokeCap.butt,
        radius: const Radius.circular(8),
        color: ColorConstant.primaryColor,
        dashPattern: const [6, 6],
        strokeWidth: 2,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: ColorConstant.primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style:   TextStyle(
                  color: ColorConstant.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
