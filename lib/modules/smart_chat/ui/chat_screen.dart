import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/chat_controller.dart';
import 'widgets/message_bubble.dart';
import 'widgets/input_area.dart';
import '../../../shared/styles/app_colors.dart';
import '../../../shared/utils/constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatController(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConstants.appTitle),
          elevation: 0,
          backgroundColor: AppColors.surface,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Expanded(
              child: Consumer<ChatController>(
                builder: (context, controller, child) {
                  if (controller.messages.isEmpty) {
                    return Center(
                      child: Text(
                        AppConstants.emptyState,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      return MessageBubble(message: controller.messages[index]);
                    },
                  );
                },
              ),
            ),
            const InputArea(),
          ],
        ),
      ),
    );
  }
}