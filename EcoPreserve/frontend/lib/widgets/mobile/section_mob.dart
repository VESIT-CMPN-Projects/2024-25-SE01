import "package:flutter/material.dart";

class SectionMob extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  final String imagePath;

  const SectionMob({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(imagePath, height: 160),
      const SizedBox(height: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xffA6FAFF)),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xffC3C3C3)),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color.fromRGBO(46, 196, 216, 0.1),
                side: const BorderSide(color: Color(0xffA6FAFF), width: 1),
                minimumSize: const Size(170, 50),
                maximumSize: const Size(170, 50)),
            child: Row(children: [
              Text(
                buttonText,
                style: const TextStyle(fontSize: 12, color: Color(0xffA6FAFF)),
              ),
              // const SizedBox(width: 10),
              Container(
                  transform: Matrix4.translationValues(8.0, 0.0, 0.0),
                  child: Image.asset(
                    "assets/images/right-arrow.png",
                    height: 16,
                  ))
            ]),
          ),
        ],
      ),
    ]);
  }
}
