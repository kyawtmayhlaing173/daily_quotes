import 'package:daily_quotes/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
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
              ],
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
}

class InputField extends StatelessWidget {
  final String hintText;
  const InputField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

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
        prefixStyle:
            GoogleFonts.montserrat(color: Colors.grey.shade600, fontSize: 14),
        hintText: hintText,
        hintStyle:
            GoogleFonts.montserrat(color: Colors.grey.shade600, fontSize: 14),
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
        return null;
      },
    );
  }
}
