import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_app/comchat/com_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComchatController extends GetxController {
  final textC = TextEditingController();

  final scrollC = ScrollController();

  final list = <ComMessage>[
    ComMessage(
        commsg: 'Hello! How can I assist you today?',
        comMsgType: ComMessageType.bot2),
  ].obs;

  Future<void> askQuestion() async {
    final question = textC.text;
    if (question.trim().isNotEmpty) {
      //user
      list.add(ComMessage(commsg: question, comMsgType: ComMessageType.user2));
      textC.text = '';

      list.add(
          ComMessage(commsg: 'Please Wait!', comMsgType: ComMessageType.bot2));
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
          list.add(ComMessage(commsg: answer, comMsgType: ComMessageType.bot2));
          _scrollDown();
        } else {
          list.removeLast();
          list.add(ComMessage(
              commsg: 'Something went wrong', comMsgType: ComMessageType.bot2));
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
