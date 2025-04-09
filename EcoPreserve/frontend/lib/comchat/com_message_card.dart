import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_app/comchat/com_message.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/size.dart';
import 'package:flutter/material.dart';
// import 'package:typewrite_text/typewrite_text.dart';

class ComMessageCard extends StatelessWidget {
  final ComMessage commessage;
  const ComMessageCard({super.key, required this.commessage});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular((15));
    final screenSize = MediaQuery.of(context).size;
    final screenSizeHeight = screenSize.height * 0.7;
    final screenSizeWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= minDesktopWidth;
        return commessage.comMsgType == ComMessageType.bot2
            ?
            //for bot
            Row(
                children: [
                  const SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.all(1.0), // Border width
                    decoration: const BoxDecoration(
                      color: CustomColor.greenSecondary, // Border color
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: CustomColor.bgLight1,
                      radius: isDesktop ? 20 : 10,
                      child: Image.asset('assets/images/roboticon.png',
                          width: isDesktop ? 25 : 13),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: screenSizeWidth *
                            .6), //accd length of text it will manage boxs width
                    margin: EdgeInsets.only(
                        bottom: screenSizeHeight * .02,
                        left: screenSizeWidth * .02),

                    padding: EdgeInsets.symmetric(
                        vertical: screenSizeHeight * .01,
                        horizontal: screenSizeWidth * .03),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColor.greenSecondary),
                      borderRadius: const BorderRadius.only(
                          topLeft: r, topRight: r, bottomRight: r),
                      color: CustomColor.btnColor,
                    ),

                    child: Text(
                      commessage.commsg,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: isDesktop ? 14 : 8,
                          fontWeight: FontWeight.w400),
                    ),
                    // child: message.msg.isEmpty ? const TypewriteText(
                    //     linesOfText: ['Please Wait...'],
                    //     textStyle: TextStyle(color: CustomColor.lightGrey, fontSize: isDesktop? 14:8, fontWeight: FontWeight.w400),
                    //     reverseAnimationDuration: Duration(milliseconds: 0),
                    //     beforeAnimationDuration: Duration(milliseconds: 100),
                    //     needCursor: false,
                    //   ) : Text(message.msg,)
                  ),
                ],
              )
            :
            //for user
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: screenSizeWidth *
                          .6), //accd length of text it will manage boxs width
                  margin: EdgeInsets.only(
                      bottom: screenSizeHeight * .02,
                      right: screenSizeWidth * .02),
                  padding: EdgeInsets.symmetric(
                      vertical: screenSizeHeight * .01,
                      horizontal: screenSizeWidth * .03),
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColor.greenSecondary),
                    borderRadius: const BorderRadius.only(
                        topLeft: r, topRight: r, bottomLeft: r),
                    color: CustomColor.btnColor,
                  ),
                  child: Text(
                    commessage.commsg,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: isDesktop ? 14 : 8,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(1.0), // Border width
                  decoration: const BoxDecoration(
                    color: CustomColor.greenSecondary, // Border color
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                      radius: isDesktop ? 20 : 10,
                      backgroundColor: CustomColor.bgLight1,
                      child: Icon(Icons.person,
                          color: CustomColor.greenSecondary,
                          size: foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                              ? 15
                              : 25)),
                ),
                const SizedBox(width: 15),
              ]);
      },
    );
  }
}
