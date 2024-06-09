import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/app_strings.dart';
import 'package:cece/core/utils/components/footer.dart';
import 'package:cece/presentation/home/items/about_us/about_us.dart';
import 'package:cece/presentation/home/items/contect_us/contect_us.dart';
import 'package:cece/presentation/home/items/home/home_item.dart';
import 'package:cece/presentation/home/items/login/login_item.dart';
import 'package:cece/presentation/home/items/register/register_item.dart';
 import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  RxInt _selectedButtonIndex  = int.parse(Get.parameters['page']??'0').obs; // Initialize with an invalid index
PageController _pageController = PageController(initialPage:int.parse(Get.parameters['page']??'0'));
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> DefaultTabController(
        length: 5,
        child: Scaffold(
          endDrawer:MediaQuery.of(context).size.width<=1000.0 ?  Drawer(
            child:Column(
              children: [
                SizedBox(height: 20.0),
                _buildElevatedButton(0, AppStrings.home),
                SizedBox(height: 20.0),
                _buildElevatedButton(1, AppStrings.aboutUs),
                SizedBox(height: 20.0),
                _buildElevatedButton(2, AppStrings.contactUs),
                SizedBox(height: 20.0),
                _buildElevatedButton(3, AppStrings.login),
                SizedBox(height: 20.0),
                _buildElevatedButton(4, AppStrings.register),
                SizedBox(height: 20.0)],
            ),
          ):null,
          appBar: AppBar(
            toolbarHeight: 100.0,
            leadingWidth: 100.0,
            leading: Image.asset(ImageConstant.logo),
            actions:MediaQuery.of(context).size.width> 1000.0 ?[ _buildElevatedButton(0, AppStrings.home),
            SizedBox(width: 20.0),
            _buildElevatedButton(1, AppStrings.aboutUs),
            SizedBox(width: 20.0),
            _buildElevatedButton(2, AppStrings.contactUs),
            SizedBox(width: 20.0),
            _buildElevatedButton(3, AppStrings.login),
            SizedBox(width: 20.0),
            _buildElevatedButton(4, AppStrings.register),
            SizedBox(width: 20.0)]:null,
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    HomeItem(tapEvent: () {
                      _selectedButtonIndex.value = 4;
                      _pageController.jumpToPage(4);
                    },),
                    AboutUsItem(tapEvent: () {
                         _selectedButtonIndex.value = 4;
                      _pageController.jumpToPage(4);
                    },),
                    ContactUsItem(tapEvent: () {
                         _selectedButtonIndex.value = 4;
                       _pageController.jumpToPage(4);
                    },),
                    LoginItem(() {
                         _selectedButtonIndex.value = 4;
                       _pageController.jumpToPage(4);
                    }) ,
                    RegisterItem(() {
                         _selectedButtonIndex.value = 3;
                       _pageController.jumpToPage(3);
                    },)
                  ]
                ),
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton(int index, String text) {
    return ElevatedButton(
      onPressed: () {
           _selectedButtonIndex.value = index;
         _pageController.jumpToPage(index);
      },
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          _selectedButtonIndex == index
              ? ColorConstant.primaryColor
              : Colors.transparent,
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(
          _selectedButtonIndex == index
              ? Colors.white // Apply selected button text color
              : Colors.black,
        ),
        elevation: MaterialStateProperty.all(
          _selectedButtonIndex == index ? 8.0 : 0.0,
        ),
      ),
    );
  }
}
