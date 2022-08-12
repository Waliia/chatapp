import 'package:chat_app1/webapis/firebase/authentication.dart';
import 'package:flutter/material.dart';

import '../signinpage/signin_page.dart';

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
              onPressed: () async {
                await signout();
                Navigator.pushReplacementNamed(context, SigninPage.PAGE_NAME);
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
