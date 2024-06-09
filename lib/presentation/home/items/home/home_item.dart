import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/components/main_button.dart';
class HomeItem extends StatelessWidget {
  void Function() tapEvent;
  HomeItem({
    Key? key,
    required this.tapEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
         children: [
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: !isMobile(context) ? 40:0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: !isMobile(context) ? MainAxisAlignment.start:MainAxisAlignment.center,
                  crossAxisAlignment: !isMobile(context) ? CrossAxisAlignment.start:CrossAxisAlignment.center,
                  children: <Widget>[
                    if (isMobile(context))
                      Image.asset(
                        ImageConstant.logo,
                        height: size.height * 0.24,
                      ),
                    const SizedBox(height: 30),
                    Text(
                      "Welcome to the Conference Events Customer Experience website",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: isDesktop(context)  ? 30 : 26,
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.primaryColor,
                        fontFamily: "HindSiliguri",
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    Text(
                        "the leading solution for event management and audience engagement. Here we ensure a smooth and swift experience for conference planners and their audience. Our website offers customizable applications to conference planners. These applications provide the timing of the conference activities and where they are held, information of its collaborators, and rating of the conference. ",
                        textAlign:isMobile(context)  ? TextAlign.center :TextAlign.start,

                        style: AppTextStyles.w700.copyWith(
                            wordSpacing: 1.2,
                            fontSize: 11,
                            fontWeight: FontWeight.w300
                        )
                    ),

                    const SizedBox(height: 20),

                    Wrap(
                      runSpacing: 10,
                      children: <Widget>[
                        MainButton(
                          title: 'GET STARTED',
                          color: ColorConstant.primaryColor,
                          tapEvent:tapEvent,
                        ),
                        const SizedBox(width: 10),

                      ],
                    )
                  ],
                ),
              )
          ),

          if (isDesktop(context) || isTab(context))
            Expanded(
                child: Image.asset(
                  ImageConstant.landingPage,
                  height: size.height * 0.6,
                )
            )
        ],
      ),
    );
  }
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;
bool isTab(BuildContext context) => MediaQuery.of(context).size.width < 1300 && MediaQuery.of(context).size.width >= 650;
bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1300;