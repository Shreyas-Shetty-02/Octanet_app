import 'package:flutter/material.dart';

class PaginationWidget extends StatefulWidget {
  final int currentPage;
  final int totalItems;
  final int itemsPerPage;
  final ValueChanged<int> onPageChanged;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalItems,
    required this.itemsPerPage,
    required this.onPageChanged,
  });

  @override
  PaginationWidgetState createState() => PaginationWidgetState();
}

class PaginationWidgetState extends State<PaginationWidget> {
  Color previousIconColor = const Color(0xFFCCCCCC);
  Color nextIconColor = const Color(0xFFCCCCCC);

  void changePreviousColor() {
    setState(() {
      previousIconColor = const Color(0xFF0066FF);
      nextIconColor = const Color(0xFFCCCCCC);
    });
  }

  void changeNextColor() {
    setState(() {
      previousIconColor = const Color(0xFFCCCCCC);
      nextIconColor = const Color(0xFF0066FF);
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = (widget.totalItems / widget.itemsPerPage).ceil();
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${widget.currentPage}/$totalPages',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(width: 3),
          Container(
            constraints: BoxConstraints.tightFor(width: 22.5, height: 20),
            child: IconButton(
              onPressed: widget.currentPage > 1
                  ? () {
                      changePreviousColor();
                      widget.onPageChanged(widget.currentPage - 1);
                    }
                  : null,
              icon: Transform.rotate(
                angle: 1.5708,
                child: Image.asset(
                  'assets/Icons/dropdown_icon.png',
                  height: 12,
                  width: 12,
                  color: previousIconColor,
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
          Container(
            constraints: BoxConstraints.tightFor(width: 22.5, height: 20),
            child: IconButton(
              onPressed: widget.currentPage < totalPages
                  ? () {
                      changeNextColor();
                      widget.onPageChanged(widget.currentPage + 1);
                    }
                  : null,
              icon: Transform.rotate(
                angle: -1.5708,
                child: Image.asset(
                  'assets/Icons/dropdown_icon.png',
                  height: 12,
                  width: 12,
                  color: nextIconColor,
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
