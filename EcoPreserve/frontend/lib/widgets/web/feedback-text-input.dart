import "package:flutter/material.dart";

class FeedbackTextInput extends StatefulWidget {
  final String question;
  final TextEditingController inputController;

  FeedbackTextInput({required this.question, required this.inputController});

  @override
  State<FeedbackTextInput> createState() => _FeedbackTextInputState();
}

class _FeedbackTextInputState extends State<FeedbackTextInput> {

  @override
  void dispose() {
    widget.inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '✦ ${widget.question}',
          style: const TextStyle(fontSize: 20, color: Color(0xff2EC4D8)),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: widget.inputController,
          style: const TextStyle(color: Colors.white),
          cursorColor: const Color(0xffA6FAFF),
          decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffA6FAFF), width: 0.5)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffA6FAFF), width: 0.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffA6FAFF), width: 1)),
              fillColor: Color.fromRGBO(49, 56, 73, 0.5),
              filled: true),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
