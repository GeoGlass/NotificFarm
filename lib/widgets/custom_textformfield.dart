import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_sus/theme/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function validator;
  final Function onTap;
  final TextInputType textInputType;
  final List<TextInputFormatter> textInputFormatter;
  final int maxLength;
  const CustomTextFormField(
      {Key key,
      this.labelText, this.controller, this.validator, this.textInputType, this.maxLength, this.textInputFormatter, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        controller: controller ?? null,
        style: TextStyle(fontSize: 14, color: Colors.black),
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
        cursorColor: kPrimary1,
        validator: validator ?? ()=>"",
        maxLength: maxLength,
        onTap: onTap ?? null,
        decoration: InputDecoration(
          counterText: "",
          contentPadding: const EdgeInsets.all(12),
          labelText: labelText,
          labelStyle: TextStyle(color: kPrimary1),
          filled: true,
          fillColor: kInputFillColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimary1),
            borderRadius: BorderRadius.zero,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimary2),
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    );
  }
}
