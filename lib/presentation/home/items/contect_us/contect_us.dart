
import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/components/default_form_faild.dart';
import '../../../../core/utils/components/main_button.dart';
import '../home/home_item.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactUsItem extends StatelessWidget {

  void Function() tapEvent ;
  ContactUsItem({
    Key? key,
    required this.tapEvent
  }) : super(key: key);

  TextEditingController messageController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Form(
      key: _formKey,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding:
                    EdgeInsets.only(right: !isMobile(context) ? 40 : 0),
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
                          "Need Support? We're Here for You",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: isDesktop(context) ? 30 : 24,
                            fontWeight: FontWeight.w800,
                            color: ColorConstant.primaryColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 550),
                          child: Text(
                              "We're here to answer your questions. Fill out the following inquiry and email it to us by pressing send.",
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
                        Wrap(runSpacing: 10, children: <Widget>[

                        ]),
                      ],
                    ),
                  )),
              if (isDesktop(context) || isTab(context))
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DefaultFormField(
                          title: "Subject",
                          hintText: "Subject",
                          prefixIcon: Icons.support_agent_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your subject ';
                            }
                            return null;
                          },
                          controller: subjectController,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 32.0),
                          child: DefaultFormField(
                            title: "Message",
                            prefixIcon: Icons.message_outlined,
                            hintText: "Enter Your message",
                            controller: messageController,
                            maxLines: 5,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Message ';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color:
                                ColorConstant.primaryColor.withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                launchEmail();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: ColorConstant.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: Center(child: Text("Send"))),
                          ),
                        ),
                      ],
                    ))
            ],
          )),
    );
  }

  void launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '1leenasultan@gmail.com',
      queryParameters: {
        'subject': subjectController.text,
        'body': messageController.text,
      },
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email';
    }
  }
}
