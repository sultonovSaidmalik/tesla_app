import 'dart:math';
import 'package:flutter/material.dart';

double radius = 95;
double strokeWidth = 30;

class CircularSlider extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;

  const CircularSlider({
    Key? key,
    required this.onAngleChanged,
  }) : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  Offset _currentDragOffset = Offset.zero;

  double currentAngle = 0.01;

  double startAngle = 270 * pi / 180;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Size canvasSize = Size(screenSize.width, screenSize.width - 35);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(center - Offset(strokeWidth, strokeWidth),
        currentAngle + startAngle, radius);

    return Stack(
      children: [
        CustomPaint(
          size: canvasSize,
          painter: SliderPainter(
            startAngle: startAngle,
            currentAngle: currentAngle,
          ),
        ),
        Positioned(
          left: knobPos.dx,
          top: knobPos.dy,
          child: GestureDetector(
            onPanStart: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              _currentDragOffset = getBox.globalToLocal(details.globalPosition);
            },
            onPanUpdate: (details) {
              var previousOffset = _currentDragOffset;
              _currentDragOffset += details.delta;
              var angle = currentAngle +
                  toAngle(_currentDragOffset, center) -
                  toAngle(previousOffset, center);
              currentAngle = normalizeAngle(angle);
              widget.onAngleChanged(currentAngle);
              setState(() {});
            },
            child: const SizedBox(
              height: 50,
              width: 50,
              child: ColoredBox(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SliderPainter extends CustomPainter {
  final double startAngle;
  final double currentAngle;

  SliderPainter({required this.startAngle, required this.currentAngle});

  List<Color> colors = const [
    Color(0xFF9EECD9),
    Color(0xFF2FB8FF),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    var rainbowPaint = Paint()
      ..shader = LinearGradient(colors: colors).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth

      /// shaklga border shaklni beradi
      ..strokeCap = StrokeCap.round;

    // canvas.drawArc(
    //   rect,
    //   startAngle,
    //   math.pi * 2,
    //   false,
    //   Paint()
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = strokeWidth
    //     ..color = Colors.transparent,
    // );

    canvas.drawArc(rect, startAngle, currentAngle, false, rainbowPaint);
  }

  @override
  bool shouldRepaint(covariant SliderPainter oldDelegate) {
    return currentAngle != oldDelegate.currentAngle;
  }
}

const fullAngleInRadians = pi * 2;

double normalizeAngle(double angle) => normalize(angle, fullAngleInRadians);

Offset toPolar(Offset center, double radians, double radius) =>
    center + Offset.fromDirection(radians, radius);

double normalize(double value, double max) => (value % max + max) % max;

double toAngle(Offset position, Offset center) => (position - center).direction;

// double toRadian(double value) => (value * pi) / 120;
