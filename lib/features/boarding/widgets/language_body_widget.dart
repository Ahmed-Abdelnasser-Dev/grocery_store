import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_button_with_icon.dart';

class LanguageBodyWidget extends StatefulWidget {
  const LanguageBodyWidget({super.key});

  @override
  State<LanguageBodyWidget> createState() => _LanguageBodyWidgetState();
}

class _LanguageBodyWidgetState extends State<LanguageBodyWidget> {
  bool isActiveButtonEngish = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Your Language',
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

        //* Language selection button
        Row(
          children: [
            Expanded(
              child: CustomButtonWithIcon(
                text: 'English',
                icon: Icons.check,
                language: 'en',
                onTap: () {
                  setState(() {
                    isActiveButtonEngish = true;
                  });
                },
                selected: isActiveButtonEngish ? true : false,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: CustomButtonWithIcon(
                text: 'العربية',
                icon: Icons.check,
                language: 'ar',
                onTap: () {
                  setState(() {
                    isActiveButtonEngish = false;
                  });
                },
                selected: isActiveButtonEngish ? false : true,
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
