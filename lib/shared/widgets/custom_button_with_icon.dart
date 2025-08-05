import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final String language;
  final VoidCallback onTap;
  final bool selected;

  const CustomButtonWithIcon({
    required this.text,
    required this.icon,
    required this.language,
    required this.onTap,
    this.selected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = const Color(0xFF143642);
    final Color unselectedColor = const Color(0xFFFEF9EF);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: selected ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? selectedColor : selectedColor,
            width: 1,
          ),
        ),
        child: Row(
          textDirection:
              language == 'en' ? TextDirection.ltr : TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : selectedColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(icon, color: selected ? Colors.white : selectedColor),
          ],
        ),
      ),
    );
  }
}
