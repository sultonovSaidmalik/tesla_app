import 'package:flutter/cupertino.dart';
import 'package:tesla/screens/charge_screen.dart';
import 'package:tesla/screens/climate_screen.dart';
import 'package:tesla/screens/control_screen.dart';
import 'package:tesla/screens/home_screen.dart';
import 'package:tesla/screens/intro_page.dart';
import 'package:tesla/screens/lock_screen.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = {
    ChargerScreen.id: (context) => const ChargerScreen(),
    ClimateScreen.id: (context) => const ClimateScreen(),
    ControlScreen.id: (context) => const ControlScreen(),
    HomeScreen.id: (context) => const HomeScreen(),
    LockScreen.id: (context) => const LockScreen(),
    IntroScreen.id: (context) => const IntroScreen(),
  };

  static void pushReplacementLockScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, LockScreen.id);
  }

  static void pushReplacementHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomeScreen.id);
  }

  static void pushClimateScreen(BuildContext context) {
    Navigator.pushNamed(context, ControlScreen.id);
  }

  static void pushChargeScreen(BuildContext context) {
    Navigator.pushNamed(context, ChargerScreen.id);
  }

  static void pushIntroScreen(BuildContext context) {
    Navigator.pushNamed(context, IntroScreen.id);
  }

  static void popBack(BuildContext context) {
    Navigator.pop(context);
  }
}
