import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:yt_down/core/String/MyStrings.dart';
import 'package:yt_down/core/colors/MyColors.dart';
import 'package:yt_down/features/splash/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
    debug: true,
    // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl:
        true, // option: set to false to disable working with http links (default: false)
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyStrings.appName,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: MyColors.primary)),
      home: const SplashScreen(),
    );
  }
}
