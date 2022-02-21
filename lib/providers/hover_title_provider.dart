

import 'package:flutter/material.dart';

class HoverTitle extends ChangeNotifier {

  bool _isHover = false;


  bool get isHover => _isHover;

  set isHover(bool value) {
    _isHover = value;
    notifyListeners();
  }


}