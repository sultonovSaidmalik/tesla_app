import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// dark version
  static const backgroundDark = Color(0xFF24272C);
  static const darkShadowDark = Color(0xFF000000);
  static const darkLabelDark = Color(0xFF7F8493);


  /// light version

  static const backgroundlight = Color(0xFFE9EAF0);
  static const lightShadowlight = Color(0xFFFFFFFF);
  static const lightLabellight = Color(0xFF757E95);
  
  
  ///text colors
  static const textGrey=Color(0xFFEBEBF5);
  static const textGrey60=Color(0x99EBEBF5);
  static const textGrey30=Color(0x99EBEBF5);

  /// gradient
  static const gradient = [
    Color(0xFF2FB8FF),
    Color(0xFF9EECD9),
  ];

  /// background unlockPageGradient color
  static const lockPageGradient = [
    Color(0xFF292C31),
    Color(0xFF000000),
    Color(0xFF000000),
    Color(0xFF292929),
  ];

  /// background unlockPageGradient color
  static const unlockPageGradient = [
    Color(0xFF2A2D32),
    Color(0xFF161719),
  ];

  /// background unlockPageGradient color
  static const appBarGradient = [
    Color(0xFF2A2D31),
    Color(0xFF282A2F),

  ];

  // Lock Button color
  static const lockButtonGradient = [
    Colors.transparent,
    Color(0xFF18171C),
  ];






}
