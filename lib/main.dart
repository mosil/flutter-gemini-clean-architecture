import 'package:flutter/material.dart';
import 'package:gemini_clean_architecture/core/app_theme.dart';
import 'package:gemini_clean_architecture/core/constants.dart';
import 'package:gemini_clean_architecture/ui/pages/chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (apiKey == "YOUR_API_KEY") {
      throw ("must change your api key in `lib/core/constants.dart'");
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.of(context),
      home: const ChatPage(),
    );
  }
}
