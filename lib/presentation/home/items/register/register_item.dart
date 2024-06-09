
import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/presentation/home/items/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/components/main_button.dart';
import '../home/home_item.dart';


class RegisterItem extends StatelessWidget {
  void Function() tapEvent;


  RegisterItem(this.tapEvent);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterController controller = RegisterController();

  RxBool isPasswordVisible = false.obs;
  RxBool isPasswordConfirmationVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                          "Create New Account !",
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
                            "If you've already been with us, there's no need to create a new account.\nSimply log in using your existing credentials and pick up right\nWhere you left off. Your journey continues seamlessly, ",
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
                        Wrap(
                          runSpacing: 10,
                          children: <Widget>[
                            MainButton(
                              title: 'Login',
                              color: ColorConstant.primaryColor,
                              tapEvent:tapEvent,
                            ),
                            const SizedBox(width: 10),
                          ],
                        )
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
              child: Obx(()=>controller.state.value.getScreenWidget(_formRegister(context),(){} )),
            )
          ],
        ),
      ),
    );
  }

  Widget _formRegister(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller:controller.nameController,
            decoration: InputDecoration(
              hintText: 'Name',
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: const TextStyle(fontSize: 12),
              contentPadding: const EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Name';
              }
              return null;
            }),
        const SizedBox(height: 30),
        TextFormField(
          controller: controller.emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
              borderSide: BorderSide(color: Colors.red.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            } else if (!value.contains('@') || !value.contains('.')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        Obx(
    ()=>TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.passwordController,
            obscureText: !isPasswordVisible.value,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                     isPasswordVisible.value = !isPasswordVisible.value;
                 },
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 5) {
                return 'Password must be at least 5 characters';
              } else if (!validateStructure(value)) {
                return 'Password must contain uppercase and lowercase letters\n, and special characters (@#%&*)';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 30),
        Obx(
    ()=> TextFormField(
            controller:controller.passwordVerificationController,
            obscureText: !isPasswordConfirmationVisible.value,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordConfirmationVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                     isPasswordConfirmationVisible.value =
                    !isPasswordConfirmationVisible.value;
                 },
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (controller.passwordController.text != value) {
                return 'Password does not match';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 30),
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
              if (_formKey.currentState!.validate() ) {
                controller.register();
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
                child: Center(child: Text("Register"))),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }



 }
bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}