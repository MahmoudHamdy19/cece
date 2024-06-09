 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../theme/app_style.dart';
import '../../../../Core/Utils/App Colors.dart';
  
  class CustomImageContainer extends StatelessWidget {
    final String imageUrl;
    final String activityTitle;

    const CustomImageContainer({ required this.imageUrl, required this.activityTitle});
  
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(activityTitle , style: AppTextStyles.w600.copyWith(
                    fontSize: 12,
                    color: AppColors.white
                  ),),
                ),
              ),
            )
          ],
        ),
      );
    }
  }