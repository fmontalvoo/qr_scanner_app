import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _currentIndex;

  UIProvider({int index}) : this._currentIndex = index;

  set currentIndex(int index) {
    this._currentIndex = index;
    notifyListeners();
  }

  int get currentIndex => this._currentIndex;
}
