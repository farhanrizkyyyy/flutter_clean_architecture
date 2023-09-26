import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/configs/route_config.dart';
import 'package:flutter_clean_architecture/src/core/constants/route_name_constant.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Clean Architecture Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: RouteConfig.pages,
      initialRoute: RouteNameConstant.postList,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
