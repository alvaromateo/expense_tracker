import 'package:flutter/material.dart';

class CustomMaterialColor extends MaterialStateColor {
  final Color _color;

  CustomMaterialColor(this._color) : super(_color.value);

  @override
  Color resolve(Set<MaterialState> states) {
    return _color;
  }
}
