import 'package:gemini_clean_architecture/models/message_type.dart';

class MessageModel {
  MessageType type;
  String text;

  MessageModel({
    required this.type,
    this.text = "",
  });
}
