import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sudoku_controls.dart';
import 'sudoku_provider.dart';
import 'sudoku_grid.dart';

final fixed = {
  Coords(1, 1): 4,
  Coords(1, 2): 1,
  Coords(1, 4): 6,
  Coords(1, 5): 9,
  Coords(2, 2): 6,
  Coords(2, 3): 8,
  Coords(2, 6): 7,
  Coords(2, 7): 1,
  Coords(2, 9): 9,
  Coords(3, 3): 3,
  Coords(3, 4): 8,
  Coords(3, 7): 4,
  Coords(3, 8): 6,
  Coords(4, 1): 2,
  Coords(4, 3): 5,
  Coords(4, 4): 7,
  Coords(4, 5): 1,
  Coords(4, 8): 4,
  Coords(5, 1): 7,
  Coords(5, 2): 4,
  Coords(5, 5): 3,
  Coords(5, 8): 1,
  Coords(5, 9): 5,
  Coords(6, 4): 5,
  Coords(6, 7): 9,
  Coords(6, 9): 2,
  Coords(7, 1): 1,
  Coords(7, 4): 4,
  Coords(7, 6): 9,
  Coords(7, 7): 6,
  Coords(7, 9): 3,
  Coords(8, 2): 3,
  Coords(8, 6): 5,
  Coords(8, 7): 7,
  Coords(8, 8): 2,
  Coords(9, 1): 8,
  Coords(9, 2): 7,
  Coords(9, 5): 2,
};

class Sudoku extends StatelessWidget {
  const Sudoku({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SudokuProvider(fixedValues: fixed),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Puzzel 1",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 10),
          SudokuGrid(),
          SizedBox(height: 25),
          Align(
            alignment: AlignmentDirectional.center,
            child: SudokuControls(),
          )
        ],
      ),
    );
  }
}
