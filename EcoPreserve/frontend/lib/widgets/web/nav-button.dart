import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavButton extends StatefulWidget {
  final String text;
  final String routeName;

  NavButton({required this.text, required this.routeName});

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isActive =
        GoRouter.of(context).routeInformationProvider.value.uri.toString() ==
            widget.routeName;

    return MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: TextButton(
            onPressed: () {
              context.go(widget.routeName);
            },
            child: Text(
              widget.text,
              style: TextStyle(
                  color: _isHovering || isActive
                      ? const Color(0xffA6FAFF)
                      : const Color(0xffC3C3C3),
                  fontSize: 17),
            ),
          ),
        ));
  }

  void _onHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }
}
