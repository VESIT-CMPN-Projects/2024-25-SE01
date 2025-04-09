import "package:flutter/material.dart";

class Section extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  final String imagePath;
  final bool isImageFirst;

  Section(
      {required this.title,
      required this.description,
      required this.buttonText,
      required this.onPressed,
      required this.imagePath,
      this.isImageFirst = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: isImageFirst
          ? [
              Expanded(flex: 4, child: Image.asset(imagePath, height: 350)),
              Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffA6FAFF)),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        description,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffC3C3C3)),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(46, 196, 216, 0.1),
                            side: const BorderSide(
                                color: Color(0xffA6FAFF), width: 1),
                            minimumSize: const Size(250, 60),
                            maximumSize: const Size(250, 60)),
                        child: Row(children: [
                          Text(
                            buttonText,
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xffA6FAFF)),
                          ),
                          // const SizedBox(width: 10),
                          Container(
                              transform:
                                  Matrix4.translationValues(10.0, 0.0, 0.0),
                              child: Image.asset(
                                "assets/images/right-arrow.png",
                                height: 23,
                              ))
                        ]),
                      ),
                    ],
                  )),
            ]
          : [
              const SizedBox(width: 20),
              Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffA6FAFF)),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        description,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffC3C3C3)),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(46, 196, 216, 0.1),
                            side: const BorderSide(
                                color: Color(0xffA6FAFF), width: 1),
                            minimumSize: const Size(250, 60),
                            maximumSize: const Size(250, 60)),
                        child: Row(children: [
                          Text(
                            buttonText,
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xffA6FAFF)),
                          ),
                          // const SizedBox(width: 10),
                          Container(
                              transform:
                                  Matrix4.translationValues(10.0, 0.0, 0.0),
                              child: Image.asset(
                                "assets/images/right-arrow.png",
                                height: 23,
                              ))
                        ]),
                      ),
                    ],
                  )),
              Expanded(flex: 4, child: Image.asset(imagePath, height: 350))
            ],
    );
  }
}
