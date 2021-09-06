import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sudoku_provider.dart';
import 'sudoku_tile.dart';

class SudokuGrid extends StatelessWidget {
  const SudokuGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final controller = context.watch<SudokuProvider>();
      final size = (constraints.biggest.shortestSide) / 9;

      return FittedBox(
        fit: BoxFit.fill,
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(size * 0.25),
          borderOnForeground: true,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size * 0.25),
            ),
            child: Column(
              children: [
                for (var y = 1; y <= 9; y++)
                  Row(
                    children: [
                      for (var x = 1; x <= 9; x++)
                        SudokuTile(
                          x,
                          y,
                          size: size,
                          value: controller.getValue(x, y),
                          isFixed: controller.isFixed(x, y),
                          isSelected: controller.isSelected(x, y),
                          isError: controller.isError(x, y),
                          onSelected: () => controller.select(x, y),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
