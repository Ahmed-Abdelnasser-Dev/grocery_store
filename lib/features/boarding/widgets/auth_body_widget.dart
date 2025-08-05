import 'package:flutter/material.dart';

class AuthBodyWidget extends StatefulWidget {
  const AuthBodyWidget({super.key});

  @override
  State<AuthBodyWidget> createState() => _AuthBodyWidgetState();
}

class _AuthBodyWidgetState extends State<AuthBodyWidget> {
  bool isActiveButtonEngish = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign In',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF143642),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Please Choose a language to proceed to the application, You can change the language later from general settings.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3F5963),
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
