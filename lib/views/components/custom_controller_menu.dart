import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesla/screens/charge_screen.dart';
import 'package:tesla/screens/climate_screen.dart';
import 'package:tesla/screens/control_screen.dart';
import 'package:tesla/screens/lock_screen.dart';
import 'package:tesla/services/app_routes.dart';
import 'package:tesla/services/constants/svg_icon.dart';
import 'package:tesla/services/themes/colors.dart';

import '../../screens/charge_screen.dart';

class CustomControlPanel extends StatefulWidget {
  const CustomControlPanel({super.key});

  @override
  State<CustomControlPanel> createState() => _CustomControlPanelState();
}

class _CustomControlPanelState extends State<CustomControlPanel> {
  bool lockFillColor = true;
  bool windSnowColor = true;
  bool chargeBulbColor = true;
  bool carDetailedColor = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xD91E1F20),
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-35, -35),
            blurRadius: 20,
            color: Color.fromRGBO(255, 255, 255, .04),
          ),
          BoxShadow(
            offset: Offset(-45, -55),
            blurRadius: 2,
            color: Color.fromRGBO(0, 0, 0, .02),
          ),
          BoxShadow(
            offset: Offset(-1, 30),
            blurRadius: 20,
            color: Color.fromRGBO(0, 0, 0, .35),
          ),
          BoxShadow(
            offset: Offset(-10, -20),
            blurRadius: 16,
            color: Color(0xFFFFFFF),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CupertinoButton(
            child:  SvgIcon.lock.copyWith(newColor: AppColors.textGrey30),
            onPressed: () {
              setState(() {
                AppRoutes.pushReplacementLockScreen(context);
              });
            },
          ),
          CupertinoButton(
            child: SvgIcon.vent.copyWith(newColor: Colors.white),

            onPressed: () {
              setState(() {
                AppRoutes.pushClimateScreen(context);
              });
            },
          ),
          CupertinoButton(
            child:SvgIcon.charge.copyWith(newColor: Colors.white),
            onPressed: () {
              setState(() {
                AppRoutes.pushChargeScreen(context);
              });
            },
          ),
          CupertinoButton(
            child: SvgIcon.car_1.copyWith(newColor: Colors.white),
            onPressed: () {
              setState(() {

              });
            },
          ),
        ],
      ),
    );
  }
}
