import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:tesla/controllers/intro_controller.dart';
import 'package:tesla/screens/lock_screen.dart';
import 'package:tesla/services/constants/images.dart';
import 'package:tesla/services/constants/svg_icon.dart';
import 'package:tesla/services/themes/colors.dart';
import 'package:tesla/services/themes/text_styles.dart';
import 'package:tesla/views/components/custom_button_app_bar.dart';

class IntroScreen extends StatefulWidget {
  static const id = "/intro";
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final IntroController controller;
  @override
  void initState() {
    controller = IntroController(setState);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CustomButtonAppBar(
                      widget: SvgIcon.settings,
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    child: Stack(
                      children: [
                        Image.asset(AppImages.tesla_dark),
                        AnimatedContainer(
                          width:400,
                          height: 300,
                          duration: const Duration(seconds: 1),
                          color: Colors.black.withOpacity(controller.carImageOpacity),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: CustomButtonLock(
                      text: "Unlock",
                      onPress: () {
                        Navigator.pushReplacementNamed(context, LockScreen.id);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonLock extends StatelessWidget {
  final void Function() onPress;
  final String text;

  const CustomButtonLock({
    super.key,
    required this.onPress,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 70,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: AppColors.lockButtonGradient,
          ),
        ),
        child: Neumorphic(
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
            color: const Color(0xFF18191B),
            depth: -10,
            shadowLightColorEmboss: Colors.white.withOpacity(0.4),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text,
                  style: AppTextStyles.sfProDisplay17
                      .copyWith(color: Colors.white),
                ),
                CustomButtonAppBar(
                  widget: SvgIcon.lock,
                  onPressed: onPress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final Widget? child;

  const Body({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.lockPageGradient,
        ),
      ),
      child: child,
    );
  }
}
