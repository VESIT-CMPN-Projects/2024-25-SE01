import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:go_router/go_router.dart';

class MenuButton extends StatefulWidget {
  final String title;
  final String path;
  final IconData icon;

  MenuButton({required this.title, required this.path, required this.icon});

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    final isActive =
        GoRouter.of(context).routeInformationProvider.value.uri.toString() ==
            widget.path;

    return ListTile(
      onTap: () {
        context.go(widget.path);
      },
      iconColor: isActive ? const Color(0xffA6FAFF) : CustomColor.lightGrey,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Icon(widget.icon),
      title: Text(widget.title),
      titleTextStyle: TextStyle(
        color: isActive ? const Color(0xffA6FAFF) : CustomColor.lightGrey,
        fontSize: 15,
      ),
    );
  }
}
