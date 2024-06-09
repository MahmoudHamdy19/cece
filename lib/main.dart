import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:url_strategy/url_strategy.dart';
import 'core/app_export.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ) ,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.standard,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstant.primaryColor,
            foregroundColor: Colors.white,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            )
          )
        )
      ),
      translations: AppLocalization(),
      locale:  const Locale('en', 'US'),
      //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      title: 'CECE',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
       getPages: AppRoutes.pages,
     );
  }
}
