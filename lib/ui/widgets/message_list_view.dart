import 'package:flutter/material.dart';
import 'package:gemini_clean_architecture/models/message_model.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({
    super.key,
    required this.list,
  });

  final List<MessageModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return _buildMessageItem(context, item);
      },
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
}
