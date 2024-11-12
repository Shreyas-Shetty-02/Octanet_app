import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ColoredPopupMenuDivider extends PopupMenuEntry<MapType> {
  final Color color;
  final double thickness;

  const ColoredPopupMenuDivider({
    super.key,
    this.color = Colors.grey,
    this.thickness = 1,
  });

  @override
  double get height => thickness;

  @override
  bool represents(MapType? value) => false;

  @override
  State<ColoredPopupMenuDivider> createState() =>
      _ColoredPopupMenuDividerState();
}

class _ColoredPopupMenuDividerState extends State<ColoredPopupMenuDivider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Container(
        height: 1,
        color: widget.color,
      ),
    );
  }
}
