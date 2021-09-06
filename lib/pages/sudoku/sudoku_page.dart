import 'package:flutter/material.dart';

import '../../widgets/sudoku/sudoku.dart';

class SudokuPage extends StatefulWidget {
  static const route = "sudoku";

  SudokuPage({Key? key}) : super(key: key);

  @override
  _SudokuPageState createState() => _SudokuPageState();
}

class _SudokuPageState extends State<SudokuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sudoku"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Sudoku(),
        ),
      ),
    );
  }
}
