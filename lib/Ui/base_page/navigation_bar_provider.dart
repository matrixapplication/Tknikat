import 'package:flutter/material.dart' hide Stack;
import 'package:taknikat/core/utils/stack.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;
  Stack<int> _stack = Stack<int>();

  set index(int index) {
    _index = index;
    _stack.push(_index);
    notifyListeners();
  }

  bool navigateToPreviousPage() {
    print(_stack);
    if (_stack.length <= 1) {
      return true;
    }
    _index = _stack.pop();
    notifyListeners();
    return false;
  }

  int get index => _index;
}
