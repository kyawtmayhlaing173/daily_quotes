import 'dart:developer';

import 'package:daily_quotes/bloc/bloc/auth_bloc.dart';
import 'package:daily_quotes/constants/app_constants.dart';
import 'package:daily_quotes/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            log("State is Unauthenticated");
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
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
                            InputField(
                              hintText: "Email",
                              controller: _emailController,
                            ),
                            const SizedBox(height: 20),
                            InputField(
                              hintText: "Password",
                              controller: _passwordController,
                            ),
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
                  )
                ],
              ),
            );
          }
          return const Text("404 Not Found");
        },
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
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<AuthBloc>(context).add(
              SignInRequested(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            );
          }
        },
        child: const Text(
          "Log In",
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
