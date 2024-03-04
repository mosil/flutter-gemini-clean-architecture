import 'package:gemini_clean_architecture/features/google_ai/data/models/message_type.dart';

class MessageEntity {
  final MessageType _type;
  final String text;

  bool get isSelf => _type.isSelf;

  const MessageEntity(
    this._type, {
    required this.text,
  });
}
