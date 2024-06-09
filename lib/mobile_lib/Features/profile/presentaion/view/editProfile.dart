  import 'package:cece/mobile_lib/Core/Utils/App%20Colors.dart';
import 'package:flutter/material.dart';

 import '../../../../Core/Utils/Assets Manager.dart';
 import '../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController shortDescriptionController = TextEditingController();


  @override
  void initState() {
     super.initState();

    String? _fullNameController = "Name test";
    fullNameController = TextEditingController(text: _fullNameController);
    String? _emailController = "test@gmail.com";
    emailController = TextEditingController(text: _emailController);
    String? _shortDescriptionController = "short Description ";
    shortDescriptionController =
        TextEditingController(text: _shortDescriptionController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  width: 120,
                  height: 120,
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
              ),
              SizedBox(height: 10.0,),
              ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.white),
                      foregroundColor: MaterialStateProperty.all(AppColors.black),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: AppColors.grey,width: 1)
                      ))
                  ), child: const Text('Change Photo',style: TextStyle(fontWeight: FontWeight.bold),)),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ) ,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Full Name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ) ,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  }
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 5,
                controller: shortDescriptionController,
                decoration: InputDecoration(
                  labelText: 'short Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ) ,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your short Description';
                  }
                  return null;
                } ,
              ),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ButtonTemplate(
                  width: double.infinity,
                  minheight: 58,
                  colorText: AppColors.white,
                  color: AppColors.primaryColor,
                  text1: 'Save Changes',
                  onPressed: () {

                  },
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }


}
