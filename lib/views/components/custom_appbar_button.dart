import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget widget;
  const CustomButton({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: const Color(0xFF232527),
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            offset: Offset(6, 6),
            blurRadius: 20,
            color: Color(0xFF13151A),
          ),
          BoxShadow(
            offset: Offset(-6, -6),
            blurRadius: 20,
            color: Color(0xff5D6167),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff5D6167).withOpacity(0.0),
            const Color(0xff13151A).withOpacity(1),
          ],
        ),
      ),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF232527),
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              const Color(0xff545659).withOpacity(0.0),
              const Color(0xff232629).withOpacity(1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1.8, color: const Color(0xFF232527)),
              color: const Color(0xff545659),
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xff5D6167).withOpacity(0.0),
                  const Color(0xff13151A).withOpacity(1),
                ],
              ),
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}