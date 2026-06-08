import 'package:flutter/material.dart';
import 'package:yt_down/core/String/MyStrings.dart';
import 'package:yt_down/core/colors/MyColors.dart';
import 'package:yt_down/features/splash/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyStrings.appName,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: MyColors.primary),
      ),
      home: const SplashScreen(),
    );
  }
}

