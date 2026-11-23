import "package:flutter/material.dart";

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);
  bool canPop() => Navigator.of(this).canPop();
}
