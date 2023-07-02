import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget widget;
  final double sizeCon1h;
  final double sizeCon1w;
  final double sizeCon2h;
  final double sizeCon2w;
  final double sizeCon3h;
  final double sizeCon3w;

  const CustomButton({
    Key? key,
    required this.widget,
    required this.onPressed,
    required this.sizeCon1h,
    required this.sizeCon1w,
    required this.sizeCon2h,
    required this.sizeCon2w,
    required this.sizeCon3h,
    required this.sizeCon3w,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        height: sizeCon1h,
        width: sizeCon1w,
        decoration: BoxDecoration(
          color: const Color(0xFF232527),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 20,
              color: Color(0xFF13151A),
            ),
            BoxShadow(
              offset: Offset(-3, -3),
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
          height: sizeCon2h,
          width: sizeCon2w,
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
          child: Container(
            height: sizeCon3h,
            width: sizeCon3w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.8,
                color: const Color(0xFF232527),
              ),
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
            child: Align(
              alignment: Alignment.center,
              child: widget,
            ),
          ),
        ),
      ),
    );
  }
}
