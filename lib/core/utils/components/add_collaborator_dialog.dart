import 'package:cece/core/app_export.dart';
import 'package:cece/data/models/collaborator_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'default_form_faild.dart';

class AddCollaboratorDialog extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? title ;
  ValueChanged<CollaboratorModel>? onPressed ;
  AddCollaboratorDialog({this.title,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:Container(
        width: 400.0,
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Add $title'??'',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "First Name",
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFormField(
                    hintText: "First Name",
                    prefixIcon: Iconsax.personalcard,
                    controller: firstNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Last Name",
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFormField(
                    hintText: "Last Name",
                    prefixIcon: Iconsax.personalcard,
                    controller: lastNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Last name';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email",
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFormField(
                    hintText: "Email",
                    prefixIcon: Icons.alternate_email,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if(!GetUtils.isEmail(value)){
                        return 'Please enter a valid email';
                      }
                      return null;

                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Center(
                child: CircleAvatar(
                  radius: 21,
                  backgroundColor: ColorConstant.primaryColor,
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        onPressed?.call(CollaboratorModel(
                          email: emailController.text ,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,

                        ));
                        Get.back();
                      }
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
