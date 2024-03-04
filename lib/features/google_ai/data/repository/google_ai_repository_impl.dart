import 'package:gemini_clean_architecture/core/models/data_res.dart';
import 'package:gemini_clean_architecture/features/google_ai/data/data_sources/google_ai_service.dart';
import 'package:gemini_clean_architecture/features/google_ai/data/models/message_model.dart';
import 'package:gemini_clean_architecture/features/google_ai/domain/entities/message.dart';
import 'package:gemini_clean_architecture/features/google_ai/domain/repository/google_ai_repository.dart';

class GoogleAiRepositoryImpl implements GoogleAiRepository {
  final GoogleAiService _aiService;

  GoogleAiRepositoryImpl(this._aiService);

  @override
  Future<DataRes<MessageEntity>> send({
    required String modelName,
    required String prompt,
  }) async {
    try {
      final response = await _aiService.send(
        modelName: modelName,
        prompt: prompt,
      );
      final model = MessageModel.fromSdk(response);
      return DataSuccess(MessageModel.convertToEntity(model));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
