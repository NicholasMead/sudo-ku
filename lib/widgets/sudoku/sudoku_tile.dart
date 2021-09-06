import 'package:flutter/material.dart';

import '../../extensions/color_extensions.dart';

abstract class _BorderConstants {
  static const color = Colors.black87;
  static const thickMultiplier = 0.04;
  static const thinMultiplier = 0.0125;
}

class SudokuTile extends StatelessWidget {
  final double size;
  final int x, y;
  final int? value;
  final bool isFixed;
  final bool isSelected;
  final bool isError;
  final VoidCallback? onSelected;

  SudokuTile(
    this.x,
    this.y, {
    required this.size,
    required this.value,
    this.onSelected,
    this.isFixed = false,
    this.isSelected = false,
    this.isError = false,
    Key? key,
  })  : assert(x > 0 && x < 10),
        assert(y > 0 && y < 10),
        super(key: key);

  BoxBorder _createBorder() {
    final thickBorder = BorderSide(
      color: _BorderConstants.color,
      width: size * _BorderConstants.thickMultiplier,
    );
    final thinBorder = BorderSide(
      color: _BorderConstants.color,
      width: size * _BorderConstants.thinMultiplier,
    );
    final noBorder = BorderSide(
      style: BorderStyle.none,
      width: 0,
    );

    return Border(
        top: y == 1
            ? noBorder
            : y % 3 == 1
                ? thickBorder
                : thinBorder,
        left: x == 1
            ? noBorder
            : x % 3 == 1
                ? thickBorder
                : thinBorder,
        bottom: y == 9 ? noBorder : thinBorder,
        right: x == 9 ? noBorder : thinBorder);
  }

  @override
  Widget build(BuildContext context) {
    late Color color;

    if (isFixed)
      color = Theme.of(context).canvasColor.darken(.25);
    else if (isSelected)
      color = Theme.of(context).primaryColor.lighten(.25);
    else if (isError)
      color = Theme.of(context).errorColor.lighten(.25);
    else
      color = Theme.of(context).canvasColor;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: _createBorder(),
        color: color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: !isFixed ? onSelected : null,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Theme.of(context).accentColor.withOpacity(0.5),
          child: Center(
            child: Text(
              value != null ? '$value' : "",
              style: TextStyle(
                fontSize: size * 0.55,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
