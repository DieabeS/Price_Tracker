import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit/app_cubit.dart';
import 'ui/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Price Tracker',
        home: BlocProvider(
          create: (BuildContext context) => AppCubit(),
          child: const HomeScreen(),
        ));
  }
}
