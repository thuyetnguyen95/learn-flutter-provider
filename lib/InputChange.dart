import 'package:flutter/material.dart';

class InputChange with ChangeNotifier {
  bool isTitleChange = false;
  bool isContenthange = false;
  bool btnState = false;

  void titleChange(text) {
    isTitleChange = text.isNotEmpty;

    this.updateBtnState();
  }

  void contentChange(text) {
    this.isContenthange = text.isNotEmpty;

    this.updateBtnState();
  }

  void updateBtnState() {
    if (!btnState && isTitleChange && isContenthange) {
      btnState = true;

      notifyListeners();
    }

    if (btnState && (isTitleChange != isContenthange)) {
      btnState = false;

      notifyListeners();
    }
  }
}
