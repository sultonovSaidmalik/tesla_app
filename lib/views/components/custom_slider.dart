import 'package:flutter/material.dart';

void main() {
  runApp(const CustomSlider());
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with TickerProviderStateMixin {
  double sliderWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: SizedBox(
            height: 15,
            width: 190,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                    height: 7.5,
                    width: 189,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.alphaBlend(Color(0xffFFFFFF).withOpacity(0.08),
                          Color(0xff000000).withOpacity(0.8)),
                    )),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1),
                  height: 7.5,
                  width: sliderWidth ,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Color(0xff2FB8FF), blurRadius: 10)
                      ],
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff2FB8FF), Color(0xff9EECD9)]),
                      borderRadius: BorderRadius.circular(20)),
                ),
                MoveableWidget(
                  func: (son) {
                    if (son >= 0) {
                      sliderWidth = son;
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
          ));
  }
}

class MoveableWidget extends StatefulWidget {
  final void Function(double size)? func;
  const MoveableWidget({this.func, super.key});

  @override
  _MoveableWidgetState createState() => _MoveableWidgetState();
}

class _MoveableWidgetState extends State<MoveableWidget> {
  double _x = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _x += details.delta.dx;
          widget.func!(_x);
        });
      },
      child: Stack(
        children: [
          AnimatedPositioned(
              left: _x < 0
                  ? 0
                  : _x > 190 - 27.5
                  ? 190 - 27.5
                  : _x,
              duration: const Duration(milliseconds: 1),
              child: const KnobWidget(
                changeSize: 1,
              )),
        ],
      ),
    );
  }
}

class KnobWidget extends StatelessWidget {
  final double changeSize;
  const KnobWidget({
    required this.changeSize,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27.5 * changeSize,
      height: 15 * changeSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25 * changeSize),
        color: const Color(0xFF212325),
        gradient: const LinearGradient(colors: [
          Color(0xFF2E3236),
          Color(0xFF141515),
        ]),
        border: Border.all(color: const Color(0xFF212325), width: 1 * 5),
      ),
      child: Center(
        child: Row(
          children: [
            const Spacer(),
            Container(
              width: 3.75 * changeSize,
              height: 13 * changeSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.56 * changeSize),
                color: const Color(0xFF272A2E),
                gradient: const LinearGradient(colors: [
                  Color(0xFF141515),
                  Color(0xFF2E3236),
                ]),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.37),
                    offset: const Offset(10, 10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: const Color(0xFFFFFFFF).withOpacity(0.07),
                    offset: const Offset(-10, -10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 2 * 2,
            ),
            Container(
              width: 3.75 * changeSize,
              height: 13 * changeSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.56 * changeSize),
                color: const Color(0xFF272A2E),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF141515),
                    Color(0xFF2E3236),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.37),
                    offset: const Offset(10, 10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: const Color(0xFFFFFFFF).withOpacity(0.07),
                    offset: const Offset(-10, -10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}