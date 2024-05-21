import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:magicalia/models/chat_message_model.dart';
import 'package:magicalia/utils/constants.dart';

class ChatRepo {
  static Future<String> chatTextGeneratorRepo(
      List<ChatMessageModel> previousMessages) async {
    try {
      Dio dio = Dio();

      final response = await dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${apiKey}",
        data: {
          "contents": previousMessages.map((e) => e.toMap()).toList(),
          "generationConfig": {
            "temperature": 0.9,
            "topK": 1,
            "topP": 1,
            "maxOutputTokens": 2048,
            "stopSequences": []
          },
          "safetySettings": [
            {
              "category": "HARM_CATEGORY_HARASSMENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_HATE_SPEECH",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            }
          ]
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        String? contentText;

        if (response.data != null &&
            response.data['candidates'] != null &&
            response.data['candidates'].isNotEmpty &&
            response.data['candidates'][0]['content'] != null &&
            response.data['candidates'][0]['content']['parts'] != null &&
            response.data['candidates'][0]['content']['parts'].isNotEmpty) {
          contentText = response.data['candidates'][0]['content']['parts'][0]['text'];
        } else {
          // Handle the case when the data is null or empty
          contentText = null;
        }

        return contentText ?? ''; // Return the contentText or an empty string if it's null
      }
      return '';
    } catch (e) {
      log(e.toString());
      return '';
    }
  }
}
