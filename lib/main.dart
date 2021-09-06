import 'package:flutter/material.dart';
import 'package:mobile_sudoku/pages/sudoku/sudoku_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: SudokuPage.route,
      routes: {
        SudokuPage.route: (_) => SudokuPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// final buttonSize = Theme.of(context).textTheme.button!.fontSize! * 2.5;