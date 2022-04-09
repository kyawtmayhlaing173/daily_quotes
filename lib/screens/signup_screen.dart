import 'package:daily_quotes/constants/app_constants.dart';
import 'package:daily_quotes/data/mixins/input_validation_mixins.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/input_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create a New Account",
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Create an account so you can manage your quotes',
                    style: GoogleFonts.ptSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const InputField(hintText: "User Name"),
                  const SizedBox(height: 20),
                  const InputField(hintText: "Email"),
                  const SizedBox(height: 20),
                  const InputField(hintText: "Password"),
                  const SizedBox(height: 15),
                  _termsAndConditionWidget(),
                  const SizedBox(height: 50),
                  _createAccountButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _termsAndConditionWidget() {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "I agree to the ",
              style: GoogleFonts.montserrat(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Terms of Service ',
                  style: GoogleFonts.montserrat(color: kTextColor),
                ),
                const TextSpan(text: 'and '),
                TextSpan(
                  text: 'Privacy and Policy',
                  style: GoogleFonts.montserrat(color: kTextColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _createAccountButtonWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Valid True')),
            );
          }
        },
        child: const Text(
          "Create Account",
          style: TextStyle(fontSize: 16),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
