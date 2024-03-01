import 'dart:ui';
import 'package:boilerplate_structure/utilities/theme_files/colors.dart';
import 'package:boilerplate_structure/utilities/theme_files/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle appBar() {
    return TextStyle(
      fontSize: 18.sp,
      fontFamily: FontFamily.poppins,
      color: AppColors.appThemeColor,
    );
  }
}
