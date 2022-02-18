import 'package:flutter/material.dart';

class ChangeTheme  with ChangeNotifier{

  bool _isDark = true;
  ThemeData theme = ThemeData.light();

  ChangeTheme(){
    darkMode();
  }
  bool get isDark => this._isDark;

  set isDark(bool value){
    this._isDark = value;
    darkMode();
    notifyListeners();
  }

  darkMode(){

    switch(_isDark){
      case true:
        this.theme = ThemeData.dark().copyWith(
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all<Color>(Colors.white),
            trackColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          scaffoldBackgroundColor: Color(0xff161D29),
        );

        break;

      case false:
        this.theme = ThemeData.light();
        break;
    }
    notifyListeners();
  }



}