import 'package:gemini_clean_architecture/core/constants.dart';
import 'package:gemini_clean_architecture/core/models/data_res.dart';
import 'package:gemini_clean_architecture/core/use_case/use_case.dart';
import 'package:gemini_clean_architecture/features/google_ai/domain/entities/message.dart';
import 'package:gemini_clean_architecture/features/google_ai/domain/repository/google_ai_repository.dart';

/// Send Prompt to Google Gemini pro model
class SendProUseCase implements UseCase<DataRes<MessageEntity>, String> {
  final GoogleAiRepository _repository;

  SendProUseCase(this._repository);

  @override
  Future<DataRes<MessageEntity>> call({required String params}) {
    return _repository.send(
      modelName: modelName,
      prompt: params,
    );
  }
}
