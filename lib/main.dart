import 'package:boilerplate_structure/utilities/constants/const_methods.dart';
import 'package:boilerplate_structure/utilities/constants/const_variables.dart';
import 'package:boilerplate_structure/screens/home_screen.dart';
import 'package:boilerplate_structure/utilities/theme_files/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ConstMethods.getDeviceSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
          ConstVariables.deviceSize.width, ConstVariables.deviceSize.height),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          home: const HomeScreen(),
        );
      },
    );
  }
}
