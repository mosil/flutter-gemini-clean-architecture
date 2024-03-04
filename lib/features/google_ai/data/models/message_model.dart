import 'package:gemini_clean_architecture/features/google_ai/data/models/message_type.dart';
import 'package:gemini_clean_architecture/features/google_ai/domain/entities/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class MessageModel {
  MessageType type;
  String text;

  MessageModel({
    required this.type,
    this.text = "",
  });

  factory MessageModel.fromSdk(GenerateContentResponse response) {
    return MessageModel(
      type: MessageType.feedback,
      text: response.text ?? "",
    );
  }

  static MessageEntity convertToEntity(MessageModel model) {
    return MessageEntity(
      model.type,
      text: model.text,
    );
  }
}
