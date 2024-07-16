import 'dart:collection';

class Stack<T> {
  final _stack = Queue<T>.from([0]);

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    _stack.removeLast();
    return _stack.last;
  }

  void clear() {
    _stack.clear();
  }

  int get length => _stack.length;

  bool get isEmpty => _stack.isEmpty;

  @override
  String toString() {
    return 'Stack<$T> : $_stack';
  }
}
