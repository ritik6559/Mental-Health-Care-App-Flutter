import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_care_app/core/theme.dart';
import 'package:mental_health_care_app/features/meditation/presentation/screens/meditation_screen.dart';
import 'package:mental_health_care_app/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:mental_health_care_app/presentation/home/screens/home_screen.dart';
import 'package:mental_health_care_app/presentation/onboarding/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NavigationBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Mental Health App',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
