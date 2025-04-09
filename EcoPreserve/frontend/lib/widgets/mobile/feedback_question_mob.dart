import "package:flutter/material.dart";

class FeedbackQuestionMob extends StatefulWidget {
  final String question;
  final List<String> options;
  final String option;
  final setOption;

  FeedbackQuestionMob(
      {required this.question,
      required this.options,
      required this.option,
      required this.setOption});

  @override
  _FeedbackQuestionMobState createState() => _FeedbackQuestionMobState();
}

class _FeedbackQuestionMobState extends State<FeedbackQuestionMob> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '✦ ${widget.question}',
          style: const TextStyle(fontSize: 15, color: Color(0xff2EC4D8)),
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            for (var option in widget.options)
              Row(
                children: [
                  // const SizedBox(width: 20),
                  Radio(
                    value: option,
                    groupValue: widget.option,
                    fillColor: WidgetStateColor.resolveWith(
                        (states) => const Color(0xffA6FAFF)),
                    hoverColor: WidgetStateColor.resolveWith(
                        (states) => const Color.fromRGBO(166, 250, 255, 0.08)),
                    onChanged: (value) {
                      widget.setOption(value);
                    },
                  ),
                  Text(
                    option,
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        color: Colors.white),
                  ),
                ],
              )
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
