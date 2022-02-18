


import 'package:flutter/material.dart';

class Search extends ChangeNotifier {

  String _valueSearchBar = '';

  String get valueSearchBar => _valueSearchBar;

  set valueSearchBar(String value){
    _valueSearchBar = value.replaceAll(' ', '+');


    notifyListeners();
  }


}