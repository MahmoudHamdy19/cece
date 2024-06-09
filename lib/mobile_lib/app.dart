 import 'package:cece/core/app_export.dart';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/mobile_lib/Core/Utils/di.dart';
import 'package:cece/mobile_lib/Features/Tabs/presentaion/view/tabs_screen.dart';
import 'package:flutter/material.dart';
 import 'Core/Utils/App Colors.dart';
import 'Features/Tabs/presentaion/manger/tabs_controller.dart';


 GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
class MobileMyApp extends StatefulWidget {
  OrganizerEvents conference ;
  MobileMyApp({required this.conference});

  @override
  State<MobileMyApp> createState() => _MobileMyAppState();
}

class _MobileMyAppState extends State<MobileMyApp> {
  @override
  void initState() {
    AppColors.primaryColor = ColorConstant.fromHex(widget.conference.conferenceDetails!.color!);
    initTabsBinding();
    Get.lazyPut(() => TabsController());
    print("initState");
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
     print("initState");
     widget.conference = widget.conference;
     return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Cece App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        platform: TargetPlatform.iOS,
        fontFamily:fontListMap[widget.conference.conferenceDetails?.fontName]?.fontFamily??"PTSans",
        primaryColor: AppColors.primaryColor,
        canvasColor: Colors.transparent,
        iconTheme:   IconThemeData(color: AppColors.primaryColor, size: 25),
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          toolbarHeight: 50,
          elevation: 0,
          surfaceTintColor: AppColors.backgroundColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.black, size: 22),
          titleTextStyle: AppTextStyles.bold.copyWith(
            color: AppColors.primaryColor,
            fontFamily: fontListMap[widget.conference.conferenceDetails?.fontName]?.fontFamily??"PTSans",
          ),
        ),

      ),
      home:TabsScreen(widget.conference),
    );
  }

  @override
  void dispose() {
    Get.delete<TabsController>();
    super.dispose();
  }
}
