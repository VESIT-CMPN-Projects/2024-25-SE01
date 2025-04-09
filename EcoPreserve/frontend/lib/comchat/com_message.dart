class ComMessage{
  String commsg;
  final ComMessageType comMsgType;

  ComMessage({required this.commsg, required this.comMsgType});

}

enum ComMessageType{user2, bot2}