import 'package:flutter/material.dart';
import 'package:gemini_clean_architecture/features/google_ai/domain/entities/message.dart';
import 'package:gemini_clean_architecture/features/google_ai/presentation/providers/chat_provider.dart';
import 'package:gemini_clean_architecture/features/google_ai/presentation/widgets/loading_view.dart';
import 'package:gemini_clean_architecture/features/google_ai/presentation/widgets/send_area_view.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);

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
                        itemCount: provider.list.length,
                        controller: _controller,
                        itemBuilder: (context, index) {
                          final item = provider.list[index];
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
                    setState(() {
                      _scrollDown();
                    });
                    _sendPrompt(context, provider, value);
                  },
                ),
              ],
            ),
            Visibility(
              visible: provider.state.isLoading,
              child: const LoadingView(),
            ),
          ],
        ),
      ),
    );
  }

  _buildMessageItem(BuildContext context, MessageEntity item) {
    final maxWidth = MediaQuery.of(context).size.width * 0.8;
    return Row(
      mainAxisAlignment: item.isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
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

  _sendPrompt(BuildContext context, ChatProvider provider, String text) async {
    provider.send(
      prompt: text,
      callback: (value) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(value),
            );
          },
        );
      },
    );
  }
}
