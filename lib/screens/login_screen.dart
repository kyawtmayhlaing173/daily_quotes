import 'package:daily_quotes/constants/app_constants.dart';
import 'package:daily_quotes/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle textStyle = GoogleFonts.montserrat(color: Colors.black);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Back 👏",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'I am happy to see you. You can continue to login for managing your quotes',
                      style: GoogleFonts.ptSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const InputField(hintText: "Email"),
                    const SizedBox(height: 20),
                    const InputField(hintText: "Password"),
                    const SizedBox(height: 5),
                    _forgotPasswordWidget(),
                    const SizedBox(height: 50),
                    _createAccountButtonWidget(),
                    Expanded(child: Container()),
                    _loginTextWidget(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forgot Password?",
          style: GoogleFonts.montserrat(color: kTextColor, fontSize: 14),
        ),
      ),
    );
  }

  Widget _createAccountButtonWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
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

  Widget _loginTextWidget() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            ),
          );
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "Already have an account? ", style: textStyle),
              TextSpan(
                text: "Sign up",
                style: GoogleFonts.montserrat(
                  color: kTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
