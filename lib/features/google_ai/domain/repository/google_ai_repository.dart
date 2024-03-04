import 'package:gemini_clean_architecture/core/models/data_res.dart';
import 'package:gemini_clean_architecture/features/google_ai/domain/entities/message.dart';

abstract class GoogleAiRepository {
  Future<DataRes<MessageEntity>> send({
    required String modelName,
    required String prompt,
  });
}
