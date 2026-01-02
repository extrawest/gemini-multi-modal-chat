import 'dart:typed_data';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  final Gemini _gemini = Gemini.instance;

  final String _modelName = 'gemini-1.5-flash';

  Future<String?> sendMessage(String text, Uint8List? imageBytes) async {
    try {
      if (imageBytes != null) {
        final value = await _gemini.textAndImage(
          text: text.isEmpty ? "Describe this image" : text,
          images: [imageBytes],
          modelName: _modelName,
        );
        return value?.output;
      } else {
        final value = await _gemini.text(
          text,
          modelName: _modelName,
        );
        return value?.output;
      }
    } catch (e) {
      print("Gemini Error: $e");
      throw Exception("Unable to get a response: $e");
    }
  }
}