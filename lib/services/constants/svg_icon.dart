import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

sealed class SvgIcon {

  /// Icons
  static SvgPicture car_1 = SvgPicture.asset("assets/icons/svg_car_1.svg");
  static SvgPicture car_2 = SvgPicture.asset("assets/icons/svg_car_2.svg");
  static SvgPicture car_3 = SvgPicture.asset("assets/icons/svg_car_3.svg");
  static SvgPicture car_window =
  SvgPicture.asset("assets/icons/svg_car_window.svg");
  static SvgPicture charge = SvgPicture.asset("assets/icons/svg_charge.svg");
  static SvgPicture chevron_bottom =
  SvgPicture.asset("assets/icons/svg_chevron_bottom.svg");
  static SvgPicture chevron_left =
  SvgPicture.asset("assets/icons/svg_chevron_left.svg");
  static SvgPicture chevron_right =
  SvgPicture.asset("assets/icons/svg_chevron_right.svg");
  static SvgPicture chevron_top =
  SvgPicture.asset("assets/icons/svg_chevron_top.svg");
  static SvgPicture cursor = SvgPicture.asset("assets/icons/svg_cursor.svg");
  static SvgPicture location =
  SvgPicture.asset("assets/icons/svg_location.svg");
  static SvgPicture location_2 =
  SvgPicture.asset("assets/icons/svg_location_2.svg");
  static SvgPicture location_charge =
  SvgPicture.asset("assets/icons/svg_location_charge.svg");
  static SvgPicture lock = SvgPicture.asset("assets/icons/svg_lock.svg");
  static SvgPicture lock_green =
  SvgPicture.asset("assets/icons/svg_lock_green.svg");
  static SvgPicture off = SvgPicture.asset("assets/icons/svg_off.svg");
  static SvgPicture person = SvgPicture.asset("assets/icons/svg_person.svg");
  static SvgPicture plus = SvgPicture.asset("assets/icons/svg_plus.svg");
  static SvgPicture settings =
  SvgPicture.asset("assets/icons/svg_settings.svg");
  static SvgPicture snow = SvgPicture.asset("assets/icons/svg_snow.svg");
  static SvgPicture speed = SvgPicture.asset("assets/icons/svg_speed.svg");
  static SvgPicture unlock = SvgPicture.asset("assets/icons/svg_unlock.svg");
  static SvgPicture vent = SvgPicture.asset("assets/icons/svg_vent.svg");
  static SvgPicture wind = SvgPicture.asset("assets/icons/svg_wind.svg");
  static SvgPicture alarm = SvgPicture.asset("assets/icons/svg_alarm.svg");
  static SvgPicture wind_water =
  SvgPicture.asset("assets/icons/svg_wind_water.svg");


}

extension ExtSvgPicture on SvgPicture {
  SvgPicture copyWith({double? newWidth, double? newHeight, Color? newColor}) {
    return SvgPicture(
      bytesLoader,
      width: newHeight ?? width,
      height: newHeight ?? height,
      colorFilter: newColor != null
          ? ColorFilter.mode(newColor, BlendMode.srcIn)
          : colorFilter,
    );
  }
}
