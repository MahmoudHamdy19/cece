import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/color_constant.dart';
import 'package:flutter/material.dart';


class DefaultFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? title;
  final bool isPassword;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final bool isActive;
  final bool? enabled;
  final String? initialValue;
  final int maxLines ;
  final bool readOnly ;
  void Function(String)? onChanged;
  final Color? fillcolor; // تم إضافة لون الخلفية كمعلمة
    DefaultFormField(
      {Key? key,
        this.labelText,
        this.enabled,
        this.hintText,
        this.controller,
        this.validator,
        this.readOnly = false,
        this.isActive = false,
        this.onFieldSubmitted,
        this.isPassword = false,
        this.keyboardType,
        this.maxLines=1,
        this.prefixIcon,
        this.onChanged,
        this.fillcolor, // تم تحديد لون الخلفية كمعلمة
        this.title,  this.initialValue, })
      : super(key: key);

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title==null ?SizedBox():Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "${widget.title}",

          ),
        ),
        TextFormField(
           onChanged:widget.onChanged,
          obscureText: widget.isPassword ? _isObscure : false,
          cursorColor: ColorConstant.primaryColor,
          enabled: widget.enabled ??true,
          controller: widget.controller,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
           autovalidateMode: AutovalidateMode.onUserInteraction,
          style:   TextStyle(
              color: ColorConstant.darkGrey, fontSize: 12, height: 1),
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                splashRadius: 20,
                icon: Icon(
                    _isObscure
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: ColorConstant.darkGrey),
                onPressed: () =>
                    setState(() => _isObscure = !_isObscure))
                : widget.isActive == true ?   Padding(
              padding: EdgeInsets.all(6.0),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: ColorConstant.primaryColor,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ):null,
            filled: true,
            prefixIcon:
            widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            contentPadding:  EdgeInsets.symmetric(
                horizontal: widget.isActive == true? 10: 8, vertical:  widget.isActive == true? 2:8),
            fillColor:
            widget.fillcolor ?? Colors.white, // استخدام لون الخلفية هنا
            hintText: widget.hintText,
            labelStyle:   TextStyle(
                color: ColorConstant.darkGrey, fontSize: 15),

            labelText: widget.labelText,

            hintStyle:
              TextStyle(color: ColorConstant.mediumGrey, fontSize: 12),
            focusedBorder:OutlineInputBorder(
              borderSide:  BorderSide(color: widget.isActive == true ? ColorConstant.lightGrey:ColorConstant.primaryColor,width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.isActive == true ? ColorConstant.lightGrey:ColorConstant.primaryColor,width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder:OutlineInputBorder(
              borderSide: BorderSide(color: widget.isActive == true ? ColorConstant.lightGrey:ColorConstant.primaryColor,width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(

              borderSide: BorderSide(color: widget.isActive == true ? ColorConstant.lightGrey:ColorConstant.primaryColor,width: 2),
              borderRadius: BorderRadius.circular(10),
            ),

          ),
        ),
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