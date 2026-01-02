import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../models/chat_message.dart';
import '../services/gemini_service.dart';

class ChatController extends ChangeNotifier {
  final GeminiService _service = GeminiService();
  final ImagePicker _picker = ImagePicker();

  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  File? _selectedImage;

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;
  File? get selectedImage => _selectedImage;

  Future<void> pickImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      _selectedImage = File(photo.path);
      notifyListeners();
    }
  }

  void clearImage() {
    _selectedImage = null;
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty && _selectedImage == null) return;

    final String userText = text;
    final File? userImage = _selectedImage;

    _messages.insert(0, ChatMessage(
      id: const Uuid().v4(),
      text: userText,
      sender: MessageSender.user,
      image: userImage,
      timestamp: DateTime.now(),
    ));

    _selectedImage = null;
    _isLoading = true;
    notifyListeners();

    try {
      final imageBytes = userImage != null ? await userImage.readAsBytes() : null;

      final responseText = await _service.sendMessage(userText, imageBytes);

      _messages.insert(0, ChatMessage(
        id: const Uuid().v4(),
        text: responseText ?? "No answer",
        sender: MessageSender.ai,
        timestamp: DateTime.now(),
      ));
    } catch (e) {
      _messages.insert(0, ChatMessage(
        id: const Uuid().v4(),
        text: "Error: $e",
        sender: MessageSender.ai,
        timestamp: DateTime.now(),
      ));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}