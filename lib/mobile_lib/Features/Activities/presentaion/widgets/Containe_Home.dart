import 'package:flutter/material.dart';

import '../../../../../theme/app_style.dart';
import '../../../../Core/Utils/App Colors.dart';



class ContainerHomeFeatures extends StatefulWidget {
  final String image;
  final String title;
  final Color color;
  final Function()? ontap;

  const ContainerHomeFeatures(
      {Key? key,
      required this.image,
      required this.title,
      required this.ontap, required this.color})
      : super(key: key);

  @override
  State<ContainerHomeFeatures> createState() => _ContainerHomeFeaturesState();
}

class _ContainerHomeFeaturesState extends State<ContainerHomeFeatures> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: widget.color.withOpacity(.8),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              color: AppColors.white,
              height: 70,
              fit: BoxFit.cover,
            ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.w300.copyWith(color: AppColors.white,fontSize: 16,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
