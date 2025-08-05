import 'package:flutter/material.dart';

class PermissionBodyWidget extends StatefulWidget {
  const PermissionBodyWidget({super.key});

  @override
  State<PermissionBodyWidget> createState() => _PermissionBodyWidgetState();
}

class _PermissionBodyWidgetState extends State<PermissionBodyWidget> {
  bool isActiveButtonEngish = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enable Location Services',
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
