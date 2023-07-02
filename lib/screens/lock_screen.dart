import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:tesla/screens/intro_page.dart';
import 'package:tesla/services/app_routes.dart';
import 'package:tesla/services/constants/svg_icon.dart';

import '../views/components/custom_button.dart';
import 'home_screen.dart';

class LockScreen extends StatefulWidget {
  static const id = "/lock";

  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  bool animation = false;

  @override
  void initState() {
    draw();
    super.initState();
  }

  void draw() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    animation = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232527),
      body: SafeArea(
        child: Column(
          children: [
            /// button appBar
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    widget: SvgIcon.settings,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, HomeScreen.id);
                    },
                    sizeCon1h: 62,
                    sizeCon1w: 62,
                    sizeCon2h: 50,
                    sizeCon2w: 50,
                    sizeCon3h: 50,
                    sizeCon3w: 50,
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                Colors.lightBlueAccent.withOpacity(0.4),
                const Color.fromRGBO(0, 0, 0, 0)
              ])),
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment:
                        animation ? Alignment.topCenter : Alignment.center,
                    duration: const Duration(seconds: 2),
                    child: const Text(
                      "Model 3",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  AnimatedAlign(
                    alignment:
                        animation ? Alignment.bottomCenter : Alignment.center,
                    duration: const Duration(seconds: 2),
                    child: AnimatedContainer(
                      width:
                          animation ? MediaQuery.of(context).size.width : 250,
                      height: animation ? 310 : 250,
                      duration: const Duration(seconds: 2),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/img_tesla_white_2.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            SizedBox(
              height: 79,
              width: 165,
              child: Neumorphic(
                style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
                  depth: -10,
                  color: const Color(0xFF18191B),
                  shadowDarkColorEmboss: const Color.fromRGBO(0, 0, 0, 0.3),
                  shadowLightColorEmboss:
                      const Color.fromRGBO(255, 255, 255, 0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(flex: 3),
                    const Text(
                      'Lock',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const Spacer(flex: 2),
                    CustomButton(
                      widget: Align(
                          alignment: Alignment.center, child: SvgIcon.unlock),
                      onPressed: () {
                        AppRoutes.pushIntroScreen(context);
                      },
                      sizeCon1h: 50,
                      sizeCon1w: 50,
                      sizeCon2h: 44,
                      sizeCon2w: 44,
                      sizeCon3h: 44,
                      sizeCon3w: 44,
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
