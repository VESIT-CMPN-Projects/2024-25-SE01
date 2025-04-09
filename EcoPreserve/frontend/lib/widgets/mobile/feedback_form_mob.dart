// import 'dart:developer';
import "package:flutter/material.dart";
import "package:flutter_app/widgets/mobile/feedback_question_mob.dart";
import "package:flutter_app/widgets/mobile/feedback_text_input_mob.dart";

class FeedbackFormMob extends StatefulWidget {
  const FeedbackFormMob({super.key});

  @override
  _FeedBackFormMobState createState() => _FeedBackFormMobState();
}

class _FeedBackFormMobState extends State<FeedbackFormMob> {
  String _answer1 = "";
  String _answer2 = "";
  String _answer3 = "";
  String _answer4 = "";
  final _inputController1 = TextEditingController();
  final _inputController2 = TextEditingController();

  void submitForm() {
    print(_answer1);
    print(_answer2);
    print(_answer3);
    print(_answer4);
    print(_inputController1.text);
    print(_inputController2.text);
    _setAnswer1("");
    _setAnswer2("");
    _setAnswer3("");
    _setAnswer4("");
    _inputController1.text = "";
    _inputController2.text = "";
  }

  void _setAnswer1(String answer) {
    setState(() {
      _answer1 = answer;
    });
  }

  void _setAnswer2(String answer) {
    setState(() {
      _answer2 = answer;
    });
  }

  void _setAnswer3(String answer) {
    setState(() {
      _answer3 = answer;
    });
  }

  void _setAnswer4(String answer) {
    setState(() {
      _answer4 = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 23, 42, 0.7),
          border: Border.all(color: const Color(0xffA6FAFF), width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        width: 800,
        child: Column(
          children: [
            FeedbackQuestionMob(
              question:
                  'How would you rate your overall experience with our website?',
              options: const ['Excellent', 'Good', 'Poor'],
              setOption: _setAnswer1,
              option: _answer1,
            ),
            FeedbackQuestionMob(
              question:
                  'How effective do you find our conflict resolution tools and advice?',
              options: const ['Effective', 'Neutral', 'Ineffective'],
              setOption: _setAnswer2,
              option: _answer2,
            ),
            FeedbackQuestionMob(
              question:
                  'How would you rate the quality of the information provided on our website?',
              options: const ['Excellent', 'Good', 'Poor'],
              setOption: _setAnswer3,
              option: _answer3,
            ),
            FeedbackQuestionMob(
              question:
                  'How effective do you find our community service and social responsibility initiatives?',
              options: const ['Effective', 'Neutral', 'Ineffective'],
              setOption: _setAnswer4,
              option: _answer4,
            ),
            FeedbackTextInputMob(
              question:
                  'What suggestions do you have for improving our website and services?',
              inputController: _inputController1,
            ),
            FeedbackTextInputMob(
              question:
                  'Do you have any additional comments or feedback you would like to share?',
              inputController: _inputController2,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: submitForm,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: Color(0xffA6FAFF), width: 1),
                backgroundColor: const Color.fromRGBO(46, 196, 216, 0.2),
              ),
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, color: Color(0xffA6FAFF)),
                  )),
            ),
          ],
        ));
  }
}
