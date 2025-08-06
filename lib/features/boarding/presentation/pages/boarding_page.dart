import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grocery_store/features/boarding/presentation/widgets/language_body_widget.dart';
import 'package:grocery_store/features/boarding/presentation/widgets/permission_body_widget.dart';
import 'package:grocery_store/features/boarding/presentation/widgets/auth_body_widget.dart';
import 'package:grocery_store/features/boarding/presentation/providers/boarding_provider.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BoardingProvider(),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/boarding/language_image.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,

                        children: [
                          Image.asset(
                            'assets/logos/grocery_store_logo_engilsh.png',
                            width: 200,
                            height: 92,
                          ),
                          SizedBox(height: 90),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Consumer<BoardingProvider>(
                        builder: (context, provider, child) {
                          final boardingSteps = [
                            _StepContent(
                              key: const ValueKey(0),
                              step: 0,
                              child: const LanguageBodyWidget(),
                            ),
                            _StepContent(
                              key: const ValueKey(1),
                              step: 1,
                              child: const PermissionBodyWidget(),
                            ),
                            _StepContent(
                              key: const ValueKey(2),
                              step: 2,
                              child: const AuthBodyWidget(),
                            ),
                          ];

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                            height:
                                provider.currentStepHeight +
                                82, // Add padding height
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF9EF),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24,
                                    left: 18,
                                    right: 18,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TweenAnimationBuilder<double>(
                                        tween: Tween<double>(
                                          begin: 0,
                                          end: provider.progress,
                                        ),
                                        duration: const Duration(
                                          milliseconds: 400,
                                        ),
                                        builder: (context, value, child) {
                                          return LinearProgressIndicator(
                                            value: value,
                                            backgroundColor: const Color(
                                              0xFF143642,
                                            ).withOpacity(0.4),
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                  Color
                                                >(Color(0xFF143642)),
                                            minHeight: 8,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 24),
                                      boardingSteps[provider.currentStep],
                                      const SizedBox(height: 24),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepContent extends StatefulWidget {
  final int step;
  final Widget child;

  const _StepContent({required this.step, required this.child, super.key});

  @override
  State<_StepContent> createState() => _StepContentState();
}

class _StepContentState extends State<_StepContent> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BoardingProvider>(context, listen: false);
      final height = context.size?.height ?? 0;
      provider.setStepHeight(widget.step, height);
    });

    return widget.child;
  }
}
