import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'shared/config/env_config.dart';
import 'modules/smart_chat/ui/chat_screen.dart';
import 'shared/styles/app_colors.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Gemini.init(
    apiKey: EnvConfig.apiKey,
    enableDebugging: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          surface: AppColors.surface,
        ),
      ),
      home: const ChatScreen(),
    );
  }
}