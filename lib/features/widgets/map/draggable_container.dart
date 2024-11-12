import 'package:flutter/material.dart';

class DraggableContainer extends StatefulWidget {
  final Color color;

  const DraggableContainer({super.key, required this.color});

  @override
  DraggableContainerState createState() => DraggableContainerState();
}

class DraggableContainerState extends State<DraggableContainer> {
  Offset position = Offset(0, 0);
  Offset? dragStart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        dragStart = details.localPosition;
      },
      child: Draggable(
        feedback: Material(
          color: Colors.transparent,
          child: Container(
            width: 60,
            height: 45,
            color: widget.color,
          ),
        ),
        childWhenDragging: Container(),
        child: Container(
          width: 60,
          height: 45,
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFCCCCCC),
            ),
            color: widget.color,
          ),
        ),
        onDragUpdate: (details) {
          if (dragStart != null) {
            setState(() {
              position = details.localPosition - dragStart!;
            });
          }
        },
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = Offset(0, 0);
          });
        },
      ),
    );
  }
}

class DragLinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final Color color;

  DragLinePainter(
      {required this.start, required this.end, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2.0;

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
