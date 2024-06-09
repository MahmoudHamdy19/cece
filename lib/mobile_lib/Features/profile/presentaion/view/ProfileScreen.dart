
 import 'package:cece/core/app_export.dart';
import 'package:cece/mobile_lib/Core/Utils/Assets%20Manager.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/Navigater.dart';
import '../../../../Core/Utils/Widgets/MessageWidget/showMyDialog.dart';

import 'SupportScreen.dart';
import 'editProfile.dart';

class ProfileScreen extends StatefulWidget {

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                      "My Profile" , style: AppTextStyles.w800.copyWith(
                        fontSize: 40,

                        color: AppColors.black
                                   )
                                   ),
                                   const SizedBox(height: 20),
                                   SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 3,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFTs4lns7y-RhqYN7YaigGkDIxqSGScRoXLQ&usqp=CAU",
                                width: 70,
                                height: 70,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    AssetsManager.logoPrimerColor,
                                    width: 70,
                                    height: 70,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                           Expanded(
                             flex: 5,
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                "Test Name",
                                    style: AppTextStyles.w600.copyWith(
                                        fontSize: 22,

                                        color: AppColors.primaryColor,
                                      overflow: TextOverflow.ellipsis
                                    )
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "test@gmail.com",
                                    style: AppTextStyles.w600.copyWith(
                                        fontSize: 20,

                                        color: AppColors.black,
                                        overflow: TextOverflow.ellipsis
                                    )
                                ),
                              ],
                          ),
                           ),

                        ],
                      ),),
                     const SizedBox(height: 40),
                   ],
                 ),
               ),
               Container(
                 height: 50.0,
                 width: double.infinity,
                 color: Colors.grey.shade200,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                      "My Account Information", style: AppTextStyles.lrTitles.copyWith(
                                     fontSize: 20,
                                     color: AppColors.black
                                     )),
                   ),
                 ),
               ),
              const Divider(
                height: 0,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                title: const Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  navigateTo(context,const EditProfileScreen() );
                },
              ),
              const Divider(),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                title: const Text("Support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  navigateTo(context,SupportScreen() );
                },
              ),
              const Divider(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(onPressed: () {
                  showMyDialog(
                      context: context,
                      ontap: () {
                       },
                      message: "log out");
                }, child: const Text("Log Out",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold),),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.white,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(
                       color: Colors.grey.shade300,
                       width: 1.0,
                     )
                   )
                 ) ,
                ),
              ),
             ],
          ),
        ),
      ),
    );
  }
}
