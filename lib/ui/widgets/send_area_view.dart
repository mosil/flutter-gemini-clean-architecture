import 'package:flutter/material.dart';

class SendAreaView extends StatelessWidget {
  SendAreaView({super.key, required this.onPressed});

  final Function(String) onPressed;

  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: const Color(0xFFA7BDE3),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _inputController,
              minLines: 1,
              maxLines: 4,
            ),
          ),
          IconButton(
            onPressed: () {
              if (_inputController.text.isNotEmpty) {
                _doPressed(_inputController.text);
              }
            },
            icon: const Icon(
              Icons.send,
              color: Color(0xFF14314D),
            ),
          ),
        ],
      ),
    );
  }

  _doPressed(String value) {
    onPressed.call(value);
    _inputController.text = "";
  }
}
