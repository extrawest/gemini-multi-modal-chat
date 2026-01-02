import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/chat_controller.dart';

class InputArea extends StatefulWidget {
  const InputArea({super.key});

  @override
  State<InputArea> createState() => _InputAreaState();
}

class _InputAreaState extends State<InputArea> {
  final TextEditingController _textCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ChatController>();

    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [
          if (controller.selectedImage != null)
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8, left: 8),
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(controller.selectedImage!, fit: BoxFit.cover),
                  ),
                ),
                IconButton(
                  onPressed: controller.clearImage,
                  icon: const Icon(Icons.close, color: Colors.red),
                )
              ],
            ),

          Row(
            children: [
              IconButton(
                onPressed: controller.pickImage,
                icon: const Icon(Icons.add_photo_alternate, color: Colors.blue),
              ),
              Expanded(
                child: TextField(
                  controller: _textCtrl,
                  decoration: const InputDecoration(
                    hintText: "Ask Gemini...",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  onSubmitted: (val) => _submit(controller),
                ),
              ),
              IconButton(
                onPressed: controller.isLoading ? null : () => _submit(controller),
                icon: controller.isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.send, color: Colors.blueAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submit(ChatController controller) {
    if (_textCtrl.text.isEmpty && controller.selectedImage == null) return;
    controller.sendMessage(_textCtrl.text);
    _textCtrl.clear();
  }
}