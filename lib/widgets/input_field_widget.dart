import 'package:google_fonts/google_fonts.dart';

import '../constants/app_constants.dart';
import '../data/mixins/input_validation_mixins.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget with InputValidationMixin {
  final String hintText;
  const InputField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.montserrat(color: Colors.black, fontSize: 14),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        errorStyle: kErrorTextStyle,
        prefixStyle: kTextStyle,
        hintText: widget.hintText,
        hintStyle: kTextStyle,
        fillColor: const Color(0xFFe8e8e8),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
      ),
      validator: (value) {
        switch (widget.hintText) {
          case 'User Name':
            return widget.isUserNameValid(userName: value!);
          case 'Email':
            return widget.isEmailValid(email: value!);
          case 'Password':
            return widget.isPasswordValid(password: value!);
          default:
        }
        return null;
      },
    );
  }
}
