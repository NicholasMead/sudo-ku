import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'sudoku_provider.dart';

class SudokuControls extends StatelessWidget {
  Widget build(BuildContext context) {
    final provider = context.watch<SudokuProvider>();

    void onSelected(int? value) {
      final current = provider.selected;
      provider.setValue(
        current.x,
        current.y,
        value: value,
      );
    }

    final buttonSize = Theme.of(context).textTheme.button!.fontSize! * 2.5;
    final buttonSpacing = buttonSize / 2;

    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int x = 1; x <= 5; x++) ...[
                _ValueControlButton(
                  size: buttonSize,
                  value: "$x",
                  onSelected: () => onSelected(x),
                ),
                if (x != 5) SizedBox(width: buttonSpacing)
              ]
            ],
          ),
          SizedBox(height: buttonSize / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int x = 6; x <= 9; x++) ...[
                _ValueControlButton(
                  size: buttonSize,
                  value: "$x",
                  onSelected: () => onSelected(x),
                ),
                SizedBox(width: buttonSpacing)
              ],
              _ValueControlButton(
                size: buttonSize,
                value: "_",
                onSelected: () => onSelected(null),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ValueControlButton extends StatelessWidget {
  final String value;
  final VoidCallback onSelected;
  final double size;

  const _ValueControlButton({
    required this.value,
    required this.onSelected,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(size / 6),
        elevation: 5,
        child: InkWell(
          child: Center(
            child: Text(value, style: Theme.of(context).textTheme.button),
          ),
          onTap: onSelected,
        ),
      ),
    );
  }
}
