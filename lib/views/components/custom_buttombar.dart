import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomPaint(
        painter: CustomButtonBorder(),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: Container(
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: Shadow.convertRadiusToSigma(5),
                sigmaX: Shadow.convertRadiusToSigma(5),
              ),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            CupertinoIcons.power,
                            color: Color(0xff2FB8FF),
                            size: 30,
                          ),
                          CupertinoButton(
                            onPressed: () {},
                            child: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                CupertinoIcons.back,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                            },
                            child: const Text(
                              "20°",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 34),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              CupertinoIcons.right_chevron,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                          const Icon(
                            CupertinoIcons.airplane,
                            color: Color(0xffEBEBF5),
                            size: 30,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "On",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Vent",
                            style: TextStyle(color: Color(0xffEBEBF5)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class CustomButtonBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.shader = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xff000000).withOpacity(0),
        Colors.white.withOpacity(0.2)
      ],
    ).createShader(const Rect.fromLTWH(0, 0, 50, 50));

    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    canvas.drawDRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(40),
      ),
      RRect.fromRectAndRadius(
        Rect.fromLTWH(1, 1, size.width - 1, size.height - 1),
        const Radius.circular(40),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}