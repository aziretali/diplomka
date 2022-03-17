import 'package:flutter/material.dart';

class ProviderAuth with ChangeNotifier {
  final phoneController = TextEditingController();
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
    phoneController.dispose();
    smsController.dispose();
    isFullFilled.dispose();
    super.dispose();
  }
}
