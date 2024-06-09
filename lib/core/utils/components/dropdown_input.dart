
import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'bottom_sheet_widget.dart';
class DropdownInput<T> extends StatefulWidget {
  final String name;
  final List<DropdownMenuItem<T>> items;
  final T? initialValue;
  final String? label;
  final IconData? leadingIcon;
  final bool enableFocusBorder;
  final Color? leadingIconColor;
  final String? Function(T?)? validator;
  final bool enabled;

  const DropdownInput({
     required this.name,
    required this.items,
    this.initialValue,
    this.label,
    this.leadingIcon,
    this.enableFocusBorder = true,
    this.leadingIconColor,
    this.validator,
    this.enabled = true,
  });

  @override
  State<DropdownInput> createState() => _DropdownInputState<T>();
}

class _DropdownInputState<T> extends State<DropdownInput<T>> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: widget.name,
      initialValue: widget.initialValue,
      builder: (field) {
        final isEmpty = field.value == null;
        return CustomInputDecorator(
          disableTapRippleEffect: true,
          onTap: () => focusNode.requestFocus(),
          focused: focusNode.hasFocus && widget.enableFocusBorder,
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 12,
          ),
          leadingIcon: widget.leadingIcon,
          leadingIconColor: widget.leadingIconColor ??
              (isEmpty ? Colors.black.withOpacity(0.40) : Colors.black),
          body: DropdownButtonFormField<T>(
            value: field.value,
            items: widget.items,
            focusNode: focusNode,
            onChanged: field.didChange,
            validator: widget.validator,
            style: const TextStyle(
              fontFamily: "Cairo",
              color: Colors.black,
              fontSize: 14,
              height: 1,
            ),
            elevation: 1,
            borderRadius: BorderRadius.circular(8),
            dropdownColor: Colors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              border: InputBorder.none,
              hintText: widget.label,
              hintStyle: const TextStyle(
                fontFamily: "Cairo",
                color: ColorConstant.darkGrey,
                fontSize: 14,
                height: 1,
              ),
            ),
          ),
        );
      },
    );
  }
}
