import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Home/presentation/widget/CustomAppbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'This application is created for educational purposes. '
                        'We do not collect, store, or share your personal information. '
                        'The app only processes the information required to search for '
                        'and download publicly available video content. Downloaded files '
                        'are stored locally on your device and are not uploaded to our servers.',

                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Open Source',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'This project is available on GitHub for educational and '
                        'learning purposes.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 10),

                  InkWell(
                    onTap: () async {
                      final url = Uri.parse(
                        'https://github.com/itsdevzam/z-mate-yt-downlaoder-and-player-flutter',
                      );

                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    child: const Text(
                      'GitHub Repository',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Custom app bar
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: CustomAppbar(text: 'Settings'),
          ),
        ],
      ),
    );
  }
}