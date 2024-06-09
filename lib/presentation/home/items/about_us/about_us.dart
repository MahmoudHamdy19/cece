  import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/components/main_button.dart';
import '../home/home_item.dart';


class AboutUsItem extends StatelessWidget {

  void Function() tapEvent ;
    AboutUsItem({
    Key? key,
    required this.tapEvent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: !isMobile(context) ? 40 : 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: !isMobile(context)
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    crossAxisAlignment: !isMobile(context)
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: <Widget>[
                      if (isMobile(context))
                        Image.asset(
                          ImageConstant.logo,
                          height: size.height * 0.24,
                        ),
                      const SizedBox(height: 30),
                      Text(
                        "About Us",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: isDesktop(context) ? 32 : 26,
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.primaryColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 550),
                        child: Text(
                            'Conferences are formal gatherings of individuals who share same interests to exchange ideas, learn, and collaborate. They are critical in facilitating learning, professional advancement, and cross-industry collaboration. But traditional conference planning techniques, such as printed schedules and map keys, have proven inefficient and difficult for both conference planners and attendees. To solve these challenges, conference planning technologies must be upgraded. This is how we founded Conference Events Customer Experience. we strive to improve attendee’s experiences, speed up conference administration, and save time and money for planners by leveraging the power of technology. ',
                            softWrap: true,
                            textAlign: isMobile(context)
                                ? TextAlign.center
                                : TextAlign.start,
                            style: AppTextStyles.w700.copyWith(
                                wordSpacing: 1.2,
                                fontSize: 11,
                                fontWeight: FontWeight.w300)),
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
                )),
            if (isDesktop(context) || isTab(context))
              Expanded(
                  child: Image.asset(
                    ImageConstant.aboutUs,
                    height: size.height * 0.6,
                  ))
          ],
        ));
  }
}
