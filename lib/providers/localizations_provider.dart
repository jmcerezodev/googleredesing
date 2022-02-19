

import 'package:flutter/material.dart';

class LocalizationsProvider extends ChangeNotifier {


  String language = 'ES';

  String get languagee => language;

  set languagee(String value){
    language = value;
    print(value);
    notifyListeners();
  }

}