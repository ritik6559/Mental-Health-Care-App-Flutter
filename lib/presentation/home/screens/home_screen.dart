import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_care_app/features/meditation/presentation/screens/meditation_screen.dart';
import 'package:mental_health_care_app/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:mental_health_care_app/presentation/bottomNavBar/bloc/navigation_state.dart';
import 'package:mental_health_care_app/presentation/bottomNavBar/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> screens = const [
    MeditationScreen(),
    Scaffold(
      body: Center(
        child: Text("hi"),
      ),
    ),
  ];

  BottomNavigationBarItem createBottomNavItem({
    required String assetName,
    required bool isActive,
    required BuildContext context,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        assetName,
        height: 45,
        color: isActive
            ? Theme.of(context).focusColor
            : Theme.of(context).primaryColor,
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationChanged) {
            return screens[state.index];
          }
          return screens[0];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is NavigationChanged) {
            currentIndex = state.index;
          }

          final List<BottomNavigationBarItem> bottomNavItems = [
            createBottomNavItem(
              assetName: 'assets/menu_home.png',
              isActive: currentIndex == 0,
              context: context,
            ),
            createBottomNavItem(
              assetName: 'assets/menu_songs.png',
              isActive: currentIndex == 1,
              context: context,
            ),
          ];

          return BottomNavBar(
            items: bottomNavItems,
            currentIndex: currentIndex,
          );
        },
      ),
    );
  }
}
