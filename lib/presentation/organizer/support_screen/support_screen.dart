import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/organizer_app_bar/organizer_app_bar.dart';
import 'package:cece/presentation/organizer/support_screen/support_controller/support_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/components/default_form_faild.dart';
import 'package:cece/presentation/home/items/home/home_item.dart';
import '../../../core/utils/components/side_menu.dart';

class SupportScreenItem extends GetWidget<SupportController>{

  @override
  Widget build(BuildContext context) {
    return
       Padding(
         padding: const EdgeInsets.all(20),
         child: Column(
           children: [
             Container(
               padding: const EdgeInsets.all(30),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15),
                 color: Colors.white,
               ),
               child: Form(
                 key: _formKey,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           "Support",
                           style: AppTextStyles.w700.copyWith(
                               fontSize: 20
                           ),
                         ),
                         const Spacer(),
                         ElevatedButton.icon(
                           style: TextButton.styleFrom(
                             iconColor: Colors.white,
                             backgroundColor: ColorConstant.primaryColor,
                             padding: const EdgeInsets.symmetric(
                               horizontal: 20,
                               vertical: 12,
                             ),
                           ),
                           onPressed: () {
                             if (_formKey.currentState!.validate()) {
                               launchEmail();
                             }
                           },
                           icon: const Icon(
                             Iconsax.send_14,
                             color: Colors.white,
                           ),
                           label: Text(
                             "Sent",
                             style: AppTextStyles.lrTitles.copyWith(
                               color: Colors.white,
                             ),
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: 33,),
                     DefaultFormField(
                       title: "subject",
                       hintText: "subject",
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Please enter your subject ';
                         }
                         return null;
                       },
                       controller: controller.subjectController,
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 18.0),
                       child: DefaultFormField(
                         title: "message",
                         hintText:"Enter Your message" ,
                         controller: controller.badyController,
                         maxLines: 5,
                         validator: (value) {
                           if (value!.isEmpty) {
                             return 'Please enter your Message ';
                           }
                           return null;
                         },
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '1leenasultan@gmail.com',
      queryParameters: {
        'subject': controller.subjectController.text,
        'body': controller.badyController.text,
      },
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email';
    }
  }
}

class SupportScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:scaffoldKey,
        backgroundColor: ColorConstant.kBgLightColor,
        drawer: Drawer(
          child: SideMenu(2),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible:isDesktop(context),
              child: SizedBox(
                width:MediaQuery.of(context).size.width*0.15,
                child:  SideMenu(2),
              ),
            ),
            SizedBox(
              width:MediaQuery.of(context).size.width*0.85,
              child: Padding(
                padding:EdgeInsets.all(isDesktop(context)?20.0:0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      OrganizerAppBarView(),
                      SizedBox(height: 20.0,),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(20)),
                          child: SupportScreenItem())
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
