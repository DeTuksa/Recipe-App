import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final VoidCallback? toggleEye;
  final KeyboardType? keyboard;
  final String? init;
  final bool isPassword;
  final Color? isPasswordColor;
  final bool? showObscureText;
  final bool obscureText;
  final Color? styleColor;
  final Color? hintStyleColor;
  final bool enabled;
  final String? labelText;
  final double? labelTextFont;
  final dynamic maxLines;
  final Color borderColor;
  final Widget? prefix;
  final Key? key;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Color fillColor;
  final bool isError;
  final String showErrorText;
  final Color enabledBorder;
  final Color focusedBorder;
  final Color labelTextColor;

  AppInputField(
      {this.hintText,
        this.validator,
        this.onSaved,
        this.toggleEye,
        this.init,
        this.isPassword = false,
        this.isPasswordColor,
        this.showObscureText,
        this.obscureText = false,
        this.keyboard,
        this.styleColor,
        this.hintStyleColor,
        this.enabled = true,
        this.labelText,
        this.labelTextFont,

        this.maxLines = 1,
        this.borderColor = Colors.grey,
        this.onChanged,
        this.prefix,
        this.key,
        this.controller,
        this.inputFormatters,
        this.fillColor = Colors.transparent,
        this.isError = false,
        this.showErrorText = "field can't be empty",
        this.enabledBorder = Colors.grey,
        this.focusedBorder = Colors.grey,
        this.labelTextColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /*Text(
        '$labelText',
        style: TextStyle(color: labelTextColor, fontSize: labelTextFont ?? 16),
      ),
      AppSpacer.H10,*/
      Padding(
        padding: EdgeInsets.all(0),
        child: TextFormField(
            inputFormatters: inputFormatters,
            controller: controller,
            key: key,
            enabled: enabled,
            style: TextStyle(color: labelTextColor),
            cursorColor: styleColor,
            obscureText: obscureText,
            maxLines: maxLines,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(25, 20, 20, 20),
              prefixIcon: prefix,
              fillColor: fillColor,
              labelText: labelText,
              filled: true,
              hintStyle: TextStyle(color: Colors.black),
              isDense: true,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red, width: 0.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: enabledBorder, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: focusedBorder, width: 0.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColor, width: 0.5),
              ),
              // contentPadding: EdgeInsets.only(top: 10, bottom: 10),
              suffixIcon: isPassword
                  ? GestureDetector(
                onTap: toggleEye,
                child: Icon(
                  showObscureText!
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Color(0xFFC0C1C3),
                ),
              )
                  : Text(''),
              errorText: isError ? showErrorText : null,
            ),
            validator: validator,
            initialValue: init,
            onSaved: onSaved,
            keyboardType: keyboard == KeyboardType.EMAIL
                ? TextInputType.emailAddress
                : keyboard == KeyboardType.NUMBER
                ? TextInputType.number
                : keyboard == KeyboardType.PHONE
                ? TextInputType.phone
                : TextInputType.text),
      ),
    ]);
  }
}

enum KeyboardType { EMAIL, PHONE, NUMBER, TEXT }