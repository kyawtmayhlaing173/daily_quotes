import 'package:daily_quotes/bloc/bloc/auth_bloc.dart';
import 'package:daily_quotes/constants/app_constants.dart';
import 'package:daily_quotes/cubit/quotes_cubit.dart';
import 'package:daily_quotes/data/repositories/auth_repository.dart';
import 'package:daily_quotes/widgets/bottom_tab_bar_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (quoteCubit) => QuotesCubit(),
          ),
          BlocProvider(
            create: (authBloc) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(authBloc),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Daily Quote',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: kPrimaryColor,
            ),
          ),
          // home: const QuoteDetail(),
          home: const BottomTabBarWidget(
            title: "Daily Quotes",
          ),
        ),
      ),
    );
  }
}
