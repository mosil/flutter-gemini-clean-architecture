import 'package:flutter/material.dart';
import 'package:gemini_clean_architecture/core/constants.dart';
import 'package:gemini_clean_architecture/models/message_model.dart';
import 'package:gemini_clean_architecture/models/message_type.dart';
import 'package:gemini_clean_architecture/ui/widgets/loading_view.dart';
import 'package:gemini_clean_architecture/ui/widgets/message_list_view.dart';
import 'package:gemini_clean_architecture/ui/widgets/send_area_view.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<MessageModel> _messages = [];
  final _model = GenerativeModel(model: modelName, apiKey: apiKey);
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gemini"),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SelectionArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MessageListView(
                        list: _messages,
                      ),
                    ),
                  ),
                ),
                SendAreaView(
                  onPressed: (value) {
                    if (value.trim().isEmpty) {
                      return;
                    }
                    _sendPrompt(value);
                  },
                ),
              ],
            ),
            Visibility(
              visible: _isLoading,
              child: const LoadingView(),
            ),
          ],
        ),
      ),
    );
  }

  _sendPrompt(String text) async {
    final content = [Content.text(text)];
    setState(() {
      _isLoading = true;
      // 將自己傳出的訊息呈現在 list 上
      // Show the outgoing text message in a list
      final self = MessageModel(type: MessageType.self, text: text);
      _messages.add(self);
    });

    try {
      // 傳出 prompt
      // Send prompt
      final response = await _model.generateContent(content);
      setState(() {
        _isLoading = false;
        // 將收到的結果呈現在 list 上
        // Display the received results in the list view
        final result = MessageModel(type: MessageType.feedback, text: response.text ?? "");
        _messages.add(result);
      });
    } catch (e) {
      // 我們傳送出去的 prompt 可能會發生無法獲得結果的狀況，這個結果不會放在 response.text 中；它有機會被用 throw 傳出，因此用 catch 來補獲會是個比較安全的做法
      // Our prompt may not get a result. This result will not be in response.text;
      // it may be thrown out using throw, so it is a good idea to use try...catch to catch it.
      setState(
        () {
          _isLoading = false;

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error"),
                content: Text(e.toString()),
              );
            },
          );
        },
      );
    }
  }
}
