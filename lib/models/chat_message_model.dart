import 'dart:convert';

class ChatMessageModel {
  final String role;
  final List<ChatPartModel> parts;

  ChatMessageModel({required this.role, required this.parts});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      role: map["role"] ?? '',
      parts: List<ChatPartModel>.from((map['parts'] ?? const []).map<ChatPartModel>((x) => ChatPartModel.fromMap(x ?? {}))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageModel.fromJson(String source) =>
      ChatMessageModel.fromMap(json.decode(source));
}

class ChatPartModel {
  final String text;

  ChatPartModel({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory ChatPartModel.fromMap(Map<String, dynamic> map) {
    return ChatPartModel(
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatPartModel.fromJson(String source) =>
      ChatPartModel.fromMap(json.decode(source));
}