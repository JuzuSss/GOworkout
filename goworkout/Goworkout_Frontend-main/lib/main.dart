import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_workout/theme/light_theme.dart';
import 'package:go_workout/view/screens/booking/booking.dart';
import 'package:go_workout/view/screens/bottom_nav_bar/bottom_navbar_test.dart';
import 'package:go_workout/view/screens/home/home.dart';
import 'package:go_workout/view/screens/launch/splash_screen.dart';
import 'package:go_workout/view/screens/profile/profile.dart';

import 'package:go_workout/view/screens/coach/sessions2/sessions2C.dart';
import 'package:go_workout/view/screens/coach/transaction_coach.dart';

void main() {
  print(Get.locale);
  runApp(MyApp());
}

final String dummyImage2 =
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D';
final String dummyImage =
    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
final String dummyImage3 =
    'https://images.unsplash.com/photo-1736144287605-3919f585752c?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMzR8fHxlbnwwfHx8fHw%3D';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,

      // fallbackLocale: Localization.fallBackLocale,
      // translations: Languages(),
      // locale: Get.locale, // Ensure it's set correctly here
      // fallbackLocale:
      //     Locale('es', 'ES'), // Fallback to Spanish if locale not set
      title: 'GO WORKOUT',
      theme: lightTheme,

      themeMode: ThemeMode.light,

      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [Profile(), Profile(), Profile(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
