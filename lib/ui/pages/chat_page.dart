import 'package:flutter/material.dart';
import 'package:gemini_clean_architecture/core/constants.dart';
import 'package:gemini_clean_architecture/models/message_model.dart';
import 'package:gemini_clean_architecture/models/message_type.dart';
import 'package:gemini_clean_architecture/ui/widgets/loading_view.dart';
import 'package:gemini_clean_architecture/ui/widgets/send_area_view.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<MessageModel> _list = [];
  final ScrollController _controller = ScrollController();
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
                      child: ListView.builder(
                        itemCount: _list.length,
                        controller: _controller,
                        itemBuilder: (context, index) {
                          final item = _list[index];
                          return _buildMessageItem(context, item);
                        },
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

  _buildMessageItem(BuildContext context, MessageModel item) {
    final maxWidth = MediaQuery.of(context).size.width * 0.8;
    return Row(
      mainAxisAlignment: item.type.isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LimitedBox(
              maxWidth: maxWidth,
              child: Text(item.text),
            ),
          ),
        ),
      ],
    );
  }

  _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.linear,
      ),
    );
  }

  _sendPrompt(String text) async {
    final content = [Content.text(text)];
    setState(() {
      _isLoading = true;
      _scrollDown();
      // 將自己傳出的訊息呈現在 list 上
      // Show the outgoing text message in a list
      final self = MessageModel(type: MessageType.self, text: text);
      _list.add(self);
    });

    try {
      // 傳出 prompt
      // Send prompt
      final response = await _model.generateContent(content);
      setState(() {
        _isLoading = false;
        _scrollDown();
        // 將收到的結果呈現在 list 上
        // Display the received results in the list view
        final result = MessageModel(type: MessageType.feedback, text: response.text ?? "");
        _list.add(result);
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
