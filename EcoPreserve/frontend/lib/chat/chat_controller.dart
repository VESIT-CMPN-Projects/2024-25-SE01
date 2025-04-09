import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_app/chat/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatController extends GetxController {
  final textC = TextEditingController();

  final scrollC = ScrollController();

  final list = <Message>[
    Message(msg: 'Hello! How can I assist you today?', msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    final question = textC.text;
    if (question.trim().isNotEmpty) {
      //user
      list.add(Message(msg: question, msgType: MessageType.user));
      textC.text = '';

      list.add(Message(msg: 'Please Wait!', msgType: MessageType.bot));
      _scrollDown();

      try {
        var response = await http.post(
          Uri.parse(foundation.kIsWeb ||
                  foundation.defaultTargetPlatform == TargetPlatform.iOS
              ? 'http://127.0.0.1:8000/api/chat/' // Use localhost for web
              : 'http://10.0.2.2:8000/api/chat/'), // Use Android emulator address for mobile
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'question': question}),
        );

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          var answer = data['response'];
          list.removeLast();
          list.add(Message(msg: answer, msgType: MessageType.bot));
          _scrollDown();
        } else {
          list.removeLast();
          list.add(
              Message(msg: 'Something went wrong', msgType: MessageType.bot));
          _scrollDown();
        }
      } catch (e) {
        print('Error occurred: $e');
      }
    }
  }

  // for moving to the end of the screen after texts increases
  void _scrollDown() {
    scrollC.animateTo(scrollC.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
