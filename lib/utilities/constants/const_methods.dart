import 'package:boilerplate_structure/utilities/constants/const_variables.dart';
import 'package:flutter/material.dart';

class ConstMethods {
  static Size getDeviceSize() {
    ConstVariables.deviceSize = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.single)
        .size;
    return ConstVariables.deviceSize;
  }
}
