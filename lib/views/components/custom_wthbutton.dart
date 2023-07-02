import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesla/views/components/custom_slider.dart';

class ControlWidget extends StatefulWidget {
  final Widget? icon;
  final String title;

  const ControlWidget({
    super.key,
    this.icon,
    required this.title,
  });

  @override
  State<ControlWidget> createState() => _ControlWidgetState();
}

class _ControlWidgetState extends State<ControlWidget> {
   late bool pressed= false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF9d9fa6),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CupertinoButton(
          onPressed: (){
            pressed = !pressed ;
            setState(() {

            });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: pressed?Colors.blue:const Color(0xFF232527),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: pressed?Colors.blue:const Color(0xff545659) ,
                  shape: BoxShape.circle,
                  gradient:  LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: pressed?[
                      const Color(0xFF11A8FD),
                      const Color(0xFF005EA3),
                    ]:[const Color(0xff2e3235),
                      const Color(0xff181919),],
                  ),
                ),
                child: widget.icon
              ),
            ),
          ),
        ),
        const Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                   CustomSlider(),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
              ],
            ),

          ],
        ),
        const Spacer(),
      ],
    );
  }
}
