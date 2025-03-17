import 'package:app_test/views/login_screen.dart';
import 'package:app_test/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/bloc/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
        // Add other BLoCs here
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue[200],
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}