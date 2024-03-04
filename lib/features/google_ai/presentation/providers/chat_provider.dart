import 'package:flutter/material.dart';
import 'package:gemini_clean_architecture/core/constants.dart';
import 'package:gemini_clean_architecture/core/models/app_state.dart';
import 'package:gemini_clean_architecture/core/models/callbacks.dart';
import 'package:gemini_clean_architecture/features/google_ai/data/data_sources/google_ai_service.dart';
import 'package:gemini_clean_architecture/features/google_ai/data/models/message_type.dart';
import 'package:gemini_clean_architecture/features/google_ai/data/repository/google_ai_repository_impl.dart';
import 'package:gemini_clean_architecture/features/google_ai/domain/entities/message.dart';
import 'package:gemini_clean_architecture/features/google_ai/domain/use_case/send_pro.dart';

class ChatProvider extends ChangeNotifier {
  late AppState state;
  late List<MessageEntity> list;
  late GoogleAiRepositoryImpl _repositoryImpl;

  ChatProvider() {
    state = AppState.init;
    list = [];
    _repositoryImpl = GoogleAiRepositoryImpl(
      GoogleAiService(
        apiKey: apiKey,
      ),
    );
  }

  send({
    required String prompt,
    required Callback<String> callback,
  }) async {
    state = AppState.loading;
    list.add(MessageEntity(MessageType.self, text: prompt));
    notifyListeners();

    final result = await SendProUseCase(_repositoryImpl).call(params: prompt);
    state = AppState.finish;
    if (result.data != null) {
      list.add(result.data!);
    } else {
      callback.call(result.error!);
    }
    notifyListeners();
  }
}
