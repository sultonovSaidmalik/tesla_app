import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesla/services/themes/texts.dart';
import '../services/local_services.dart';
import '../views/components/custom_controller_menu.dart';

class ClimateScreen extends StatefulWidget {
  static const id = "/climate";
  const ClimateScreen({super.key});

  @override
  State<ClimateScreen> createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF2A2D32),Color(0xFF131313)],transform:GradientRotation((180*pi)/360)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Texts.strKm187.tr(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      LocalGovernment.func(
                          context, LocalGovernment.english.locale);
                    },
                    color: Colors.orangeAccent,
                    minWidth: 70,
                    child: const Text("English").tr(),
                  ),
                  const SizedBox(width: 5),
                  MaterialButton(
                    onPressed: () {
                      LocalGovernment.func(
                          context, LocalGovernment.russia.locale);
                    },
                    color: Colors.redAccent,
                    minWidth: 70,
                    child: const Text("Russia").tr(),
                  ),
                  const SizedBox(width: 5),
                  CupertinoButton(
                    onPressed: () {
                      LocalGovernment.func(
                          context, LocalGovernment.uzbek
                          .locale);
                    },
                    color: Colors.blueAccent,
                    minSize: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("Uzbek").tr(),
                  ),
                ],
              ),
              const CustomControlPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
