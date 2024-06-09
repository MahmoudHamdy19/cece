
import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/presentation/home/items/forget_password/controller/login_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/components/main_button.dart';
import '../home/home_item.dart';


class ForgetPasswordItem extends StatelessWidget {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ForgetPasswordController controller = ForgetPasswordController() ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        centerTitle: true,
         leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            isMobile(context)
                  ? const SizedBox()
                  : Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Forget Password",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize:
                              isDesktop(context) ? 30 : 26,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.primaryColor,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Enter your email and we will send you a link to reset your password",
                              softWrap: true,
                              textAlign: isMobile(context)
                                  ? TextAlign.center
                                  : TextAlign.start,
                              style: AppTextStyles.w700.copyWith(
                                  wordSpacing: 1.2,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300)),
                          const SizedBox(
                            height: 30,
                          ),
      
                        ],
                      ),
                    ),
                    if (isDesktop(context))
                      Expanded(
                        child: Image.asset(
                          ImageConstant.landingPage,
                          width: 400,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                width: isMobile(context) ? 350 : 390,
                child: Obx(()=>controller.state.value.getScreenWidget(_formLogin(), (){})),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _formLogin() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: controller.emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            } else if (!value.contains('@') || !value.contains('.')) {
              return 'Please enter a valid email';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Email',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade200),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),

        const SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: ColorConstant.primaryColor.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child:ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.forgetPassword();
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
        SizedBox(height: 40),
      ],
    );
  }

}

