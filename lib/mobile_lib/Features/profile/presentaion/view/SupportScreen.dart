
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/Responsive.dart';
import '../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
class SupportScreen extends StatefulWidget {

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  TextEditingController badyController = TextEditingController();

  TextEditingController subjectController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'test@gmail.com',
      queryParameters: {
        'subject': subjectController.text,
        'body': badyController.text,
      },
    );

    try {
      if (await canLaunch(emailLaunchUri.toString())) {
        await launch(emailLaunchUri.toString());
      } else {
        throw 'Could not launch email';
      }
    } catch (e) {
      print('Error launching email: $e');
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
        
              children: [
        SizedBox(height: MediaQueryHelper.sizeFromHeight(context, 4),),
                TextFormField(
                    controller: subjectController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your subject ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                    labelText: 'Subject',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  )
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  controller: badyController,
                    maxLines: 5,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your massage ';
                      }
                      return null;
                    },
                   decoration: InputDecoration(
                        labelText: 'Massage',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ) ,
                ),
                SizedBox(height: 20.0,),
                 ButtonTemplate(
                   width: double.infinity,
                  color: AppColors.primaryColor,
                  text1: "Sent",
                  colorText: AppColors.white,
                  fontSize: 25,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      launchEmail();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
