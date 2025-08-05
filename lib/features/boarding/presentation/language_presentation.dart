import 'package:flutter/material.dart';
import 'package:grocery_store/features/boarding/widgets/language_body_widget.dart';
import 'package:grocery_store/features/boarding/widgets/permission_body_widget.dart';
import 'package:grocery_store/features/boarding/widgets/auth_body_widget.dart';

class LanguagePresentation extends StatefulWidget {
  const LanguagePresentation({super.key});

  @override
  State<LanguagePresentation> createState() => _LanguagePresentationState();
}

class _LanguagePresentationState extends State<LanguagePresentation> {
  int currentStep = 0;
  final List<Widget> boardingSteps = [
    LanguageBodyWidget(),
    PermissionBodyWidget(),
    AuthBodyWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Stack(
              children: [
                //* Background image with overlay
                Image.asset(
                  'assets/images/boarding/language_image.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                //* Content
                Column(
                  children: [
                    //* Logo
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Image.asset(
                          'assets/logos/grocery_store_logo_engilsh.png',
                          width: 200,
                          height: 92,
                        ),
                      ),
                    ),
                    //* white box
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFEF9EF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          top: 24,
                          left: 18,
                          right: 18,
                          bottom: 34,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LinearProgressIndicator(
                              value:
                                  1 / boardingSteps.length * (currentStep + 1),
                              backgroundColor: Color(
                                0xFF143642,
                              ).withOpacity(0.4),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF143642),
                              ),
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            SizedBox(height: 24),
                            boardingSteps[currentStep],
                            SizedBox(height: 16),
                            //* Next
                            Row(
                              children: [
                                Expanded(
                                  child:
                                      currentStep == 0
                                          ? ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                if (currentStep <
                                                    boardingSteps.length - 1) {
                                                  currentStep++;
                                                }
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(
                                                0xFF143642,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              elevation: 0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 16,
                                                  ),
                                            ),
                                            child: const Text(
                                              'Next',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                          : SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
