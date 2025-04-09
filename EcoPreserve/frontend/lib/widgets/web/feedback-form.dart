// import 'dart:developer';
import "package:flutter/material.dart";
import "package:flutter_app/widgets/web/feedback-question.dart";
import "package:flutter_app/widgets/web/feedback-text-input.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  _FeedBackFormState createState() => _FeedBackFormState();
}

class _FeedBackFormState extends State<FeedbackForm> {
  String _answer1 = "";
  String _answer2 = "";
  String _answer3 = "";
  String _answer4 = "";
  final _inputController1 = TextEditingController();
  final _inputController2 = TextEditingController();

  Future<void> submitForm() async {
    final feedbackData = {
      'experience': _answer1,
      'conflict_resolution_effectiveness': _answer2,
      'information_quality': _answer3,
      'community_service_effectiveness': _answer4,
      'suggestions': _inputController1.text,
      'comments': _inputController2.text,
    };

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/feedback/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(feedbackData),
      );

      if (response.statusCode == 201) {
        // Successfully submitted
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Feedback submitted successfully')),
        );
      } else {
        // Error occurred
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to submit feedback')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred: $e')),
      );
    }
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
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 23, 42, 0.7),
          border: Border.all(color: const Color(0xffA6FAFF), width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        width: 800,
        child: Column(
          children: [
            FeedbackQuestion(
              question:
                  'How would you rate your overall experience with our website?',
              options: const ['Excellent', 'Good', 'Poor'],
              setOption: _setAnswer1,
              option: _answer1,
            ),
            FeedbackQuestion(
              question:
                  'How effective do you find our conflict resolution tools and advice?',
              options: const ['Effective', 'Neutral', 'Ineffective'],
              setOption: _setAnswer2,
              option: _answer2,
            ),
            FeedbackQuestion(
              question:
                  'How would you rate the quality of the information provided on our website?',
              options: const ['Excellent', 'Good', 'Poor'],
              setOption: _setAnswer3,
              option: _answer3,
            ),
            FeedbackQuestion(
              question:
                  'How effective do you find our community service and social responsibility initiatives?',
              options: const ['Effective', 'Neutral', 'Ineffective'],
              setOption: _setAnswer4,
              option: _answer4,
            ),
            FeedbackTextInput(
              question:
                  'What suggestions do you have for improving our website and services?',
              inputController: _inputController1,
            ),
            FeedbackTextInput(
              question:
                  'Do you have any additional comments or feedback you would like to share?',
              inputController: _inputController2,
            ),
            const SizedBox(height: 20),
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
                  padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, color: Color(0xffA6FAFF)),
                  )),
            ),
          ],
        ));
  }
}
