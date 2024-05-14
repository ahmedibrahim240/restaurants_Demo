import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/core/theme/theme.dart';

import 'core/config/size_config.dart';
import 'service/binding.dart';
import 'view/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context, designSize: const Size(360, 800));
    return GetMaterialApp(
      title: 'restaurants Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.darkMode,
      initialBinding: Binding(),
      home: const HomeScreen(),
    );
  }
}
