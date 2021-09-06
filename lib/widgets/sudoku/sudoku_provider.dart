import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SudokuProvider with ChangeNotifier {
  final Map<Coords, int> _fixed = {};
  final Map<Coords, int> _completed = {};

  Coords selected = Coords(0, 0);

  SudokuProvider({Map<Coords, int>? fixedValues}) {
    _fixed.addAll(fixedValues ?? {});
  }

  int? getValue(int x, int y) {
    final c = Coords(x, y);

    if (_fixed.containsKey(c)) return _fixed[c];
    if (_completed.containsKey(c)) return _completed[c];
    return null;
  }

  void setValue(int x, int y, {required int? value}) {
    if (value != null)
      _completed[Coords(x, y)] = value;
    else
      _completed.removeWhere((c, _) => c.isMatch(x, y));

    notifyListeners();
  }

  void select(int x, int y) {
    selected = Coords(x, y);
    notifyListeners();
  }

  Iterable<Coords> allInBlock(int x, int y) sync* {
    var startX = 3 * ((x - 1) / 3).floor() + 1;
    var startY = 3 * ((y - 1) / 3).floor() + 1;

    for (var dx = startX; dx < startX + 3; dx++) {
      for (var dy = startY; dy < startY + 3; dy++) {
        yield Coords(dx, dy);
      }
    }
  }

  bool isFixed(int x, int y) => _fixed.containsKey(Coords(x, y));

  bool isSelected(int x, int y) => selected == Coords(x, y);

  bool isError(int x, int y) {
    var value = getValue(x, y);

    if (value == null) return false;

    for (var dx = 1; dx <= 9; dx++) {
      if (dx != x && getValue(dx, y) == value) {
        return true;
      }
    }

    for (var dy = 1; dy <= 9; dy++) {
      if (dy != y && getValue(x, dy) == value) {
        return true;
      }
    }

    var duplicateInBlock =
        allInBlock(x, y).where((c) => !c.isMatch(x, y)).any((c) => getValue(c.x, c.y) == value);

    return duplicateInBlock;
  }

  bool isComplete() {
    for (var x = 1; x <= 9; x++) {
      for (var y = 1; y <= 9; y++) {
        if (getValue(x, y) == null || isError(x, y)) {
          return false;
        }
      }
    }
    return true;
  }
}

class Coords with EquatableMixin {
  final int x, y;

  const Coords(this.x, this.y);

  bool isMatch(int x, int y) => this.x == x && this.y == y;

  Coords moveUp({int by = 1}) => Coords(x, y + by);

  Coords moveDown({int by = 1}) => Coords(x, y - by);

  Coords moveRight({int by = 1}) => Coords(x + by, y);

  Coords moveLeft({int by = 1}) => Coords(x - by, y);

  @override
  List<Object?> get props => [x, y];
}
// class CoordsValue extends Coords {
//   final int value;

//   const CoordsValue(int x, int y, {required this.value}) : super(x, y);
// }
