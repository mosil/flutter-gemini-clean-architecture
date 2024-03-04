import 'package:google_generative_ai/google_generative_ai.dart';

class GoogleAiService {
  final String apiKey;

  GoogleAiService({required this.apiKey});

  Future<GenerateContentResponse> send({
    required String modelName,
    required String prompt,
  }) async {
    final content = [Content.text(prompt)];
    final model = GenerativeModel(model: modelName, apiKey: apiKey);
    return await model.generateContent(content);
  }
}
