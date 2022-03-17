import 'package:flutter/material.dart';

class ProviderSmsAuth with ChangeNotifier {
  final smsController = TextEditingController();
  final isFullFilled = ValueNotifier<bool>(false);

  void setIsFullFilled() {
    isFullFilled.value = true;
    notifyListeners();
  }

  void setNotFullFilled() {
    isFullFilled.value = false;
    notifyListeners();
  }

  @override
  void dispose() {
    smsController.dispose();
    isFullFilled.dispose();
    super.dispose();
  }
}
