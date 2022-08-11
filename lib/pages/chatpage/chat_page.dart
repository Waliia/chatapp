import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static const String PAGE_NAME = 'chatpage';
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kdsaajkd'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
