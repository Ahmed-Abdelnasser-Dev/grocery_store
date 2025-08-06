import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../providers/boarding_provider.dart';

class PermissionBodyWidget extends StatefulWidget {
  const PermissionBodyWidget({super.key});

  @override
  State<PermissionBodyWidget> createState() => _PermissionBodyWidgetState();
}

class _PermissionBodyWidgetState extends State<PermissionBodyWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BoardingProvider>(context, listen: false);

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
          'Please allow location access to find stores near you. You can change this later in settings.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3F5963),
          ),
        ),
        SizedBox(height: 24),
        CustomButton(
          buttonText: 'Grant Permission',
          onTap: () {
            provider.nextStep();
          },
        ),
      ],
    );
  }
}
