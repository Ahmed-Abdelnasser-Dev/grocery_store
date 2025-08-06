// boarding_provider.dart
import 'package:flutter/material.dart';

class BoardingProvider extends ChangeNotifier {
  // This variable keeps track of the current step in the boarding process and being updated rapidly only here
  int _currentStep = 0;

  // the steps are [Language, Permission, Auth] might add welcome step later
  final int _totalSteps = 3;

  int get currentStep => _currentStep;
  int get totalSteps => _totalSteps;

  final Map<int, double> _stepContentHeights = {};

  void setStepHeight(int step, double height) {
    _stepContentHeights[step] = height;
    notifyListeners();
  }

  double get currentStepHeight {
    return _stepContentHeights[_currentStep] ?? 300.0;
  }

  // this method is used to go to the next step and passed to the buttons like (next, Grant Access)
  void nextStep() {
    if (_currentStep < _totalSteps - 1) {
      _currentStep++;
      notifyListeners();
    }
  }

  // this method is used to go back to the previous step and passed to the buttons like (back)
  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  // this method is used to go to a specific step (only used during testing)
  void goToStep(int step) {
    if (step >= 0 && step < _totalSteps) {
      _currentStep = step;
      notifyListeners();
    }
  }

  // this getter is to calculate the progress of the steps and returns the value as frictions
  double get progress => (_currentStep + 1) / _totalSteps;

  double get pageHeight => 0.5;
}
