import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/my_home_page.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
          brightness: Brightness.light, primaryColor: AppColors.primary),
          home: MyHomePage(),
    );
  }
}
