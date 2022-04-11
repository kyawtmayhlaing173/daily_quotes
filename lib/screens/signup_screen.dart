import 'dart:developer';

import 'package:daily_quotes/constants/app_constants.dart';
import 'package:daily_quotes/data/mixins/input_validation_mixins.dart';
import 'package:daily_quotes/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/bloc/auth_bloc.dart';
import '../widgets/input_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is Loading) {
            log("State is Loading");
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UnAuthenticated) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF787A91),
                          ),
                        ),
                        const SizedBox(height: 10),
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
                        InputField(
                          hintText: "User Name",
                          controller: _userNameController,
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          hintText: "Email",
                          controller: _emailController,
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          hintText: "Password",
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 15),
                        _termsAndConditionWidget(),
                        const SizedBox(height: 50),
                        _createAccountButtonWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Text("404 Not Found");
        },
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
            BlocProvider.of<AuthBloc>(context).add(
              SignUpRequested(
                  email: _emailController.text,
                  password: _passwordController.text),
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
