import 'dart:developer';

import 'package:daily_quotes/constants/app_constants.dart';
import 'package:daily_quotes/data/repositories/auth_repository.dart';
import 'package:daily_quotes/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/bloc/auth_bloc.dart';
import '../widgets/bottom_tab_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthRepository _authRepository = AuthRepository();
  var user;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  getCurrentUser() async {
    user = await _authRepository.getCurrentUser();
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const BottomTabBarWidget(
                  title: "Daily Quotes",
                ),
              ),
              (Route<dynamic> route) => route.isFirst,
            );
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return BlocProvider.value(
            //         value: BlocProvider.of<AuthBloc>(context),
            //         child: const LoginScreen(),
            //       );
            //     },
            //   ),
            // );
          }
        },
        child: FutureBuilder(
          future: getCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Positioned(
                    top: 0.0,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ), //Icon
                  ),
                  Positioned(
                    top: 100,
                    child: Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _profileCardWidget(),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          log("Logged out button is pressed");
                          BlocProvider.of<AuthBloc>(context).add(
                            SignOutRequested(),
                          );
                        },
                        child: const Text(
                          "Log Out",
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
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _profileCardWidget() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(60), // Image radius
                child: Image.network(
                  'https://i.pinimg.com/564x/c9/3f/21/c93f211b676a12f2301791ad457392ea.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['email'],
                  style:
                      GoogleFonts.montserrat(color: Colors.black, fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  "Senior Developer",
                  style: GoogleFonts.montserrat(
                      color: Colors.grey.shade600, fontSize: 14),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFEEEEEE),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Liked Quotes',
                            style: GoogleFonts.montserrat(
                                color: Colors.grey.shade600, fontSize: 12),
                          ),
                          Text(
                            '34',
                            style: GoogleFonts.montserrat(
                                color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            'My Quotes',
                            style: GoogleFonts.montserrat(
                                color: Colors.grey.shade600, fontSize: 12),
                          ),
                          Text(
                            '34',
                            style: GoogleFonts.montserrat(
                                color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
