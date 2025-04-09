import 'package:flutter/material.dart';
import 'package:flutter_app/constants/size.dart';
import 'package:flutter_app/widgets/web/feedback-form.dart';
import 'package:flutter_app/widgets/web/navbar.dart';
import 'package:flutter_app/widgets/mobile/drawer_mob.dart';
import 'package:flutter_app/widgets/mobile/feedback_form_mob.dart';
import 'package:flutter_app/widgets/mobile/navbar_mob.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= minDesktopWidth;
        return Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFF001120),
            appBar: isDesktop
                ? const Navbar()
                : NavbarMob(
                    onMenuTap: () {
                      // This will open right side drawer
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
            endDrawer: isDesktop ? null : const DrawerMob(),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Help Us Improve Your Experience',
                      style: TextStyle(
                          fontSize: isDesktop ? 35 : 22,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffA6FAFF)),
                    ),
                    const SizedBox(height: 20),
                    isDesktop ? const FeedbackForm() : const FeedbackFormMob(),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
