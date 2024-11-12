import 'package:flutter/material.dart';

class ItemsPerPageWidget extends StatefulWidget {
  final int itemsPerPage;
  final Function(int) onItemsPerPageChanged;

  const ItemsPerPageWidget({
    super.key,
    required this.itemsPerPage,
    required this.onItemsPerPageChanged,
  });

  @override
  ItemsPerPageWidgetState createState() => ItemsPerPageWidgetState();
}

class ItemsPerPageWidgetState extends State<ItemsPerPageWidget> {
  late int _itemsPerPage;

  @override
  void initState() {
    super.initState();
    _itemsPerPage = widget.itemsPerPage;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Text('Items per page: ',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFFCCCCCC)
                    : const Color(0xFF1A1A1A),
              )),
          DropdownButton<int>(
            value: _itemsPerPage,
            isDense: true,
            menuWidth: 60,
            dropdownColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF000000)
                : const Color(0xFFFFFFFF),
            icon: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              child: Image.asset(
                'assets/Icons/dropdown_icon.png',
                height: 12,
                width: 12,
                color: const Color(0xFFCCCCCC),
              ),
            ),
            items: [
              DropdownMenuItem(
                  value: 10,
                  child: Center(
                      child: Text('10',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                          )))),
              DropdownMenuItem(
                  value: 20,
                  child: Center(
                      child: Text('20',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                          )))),
              DropdownMenuItem(
                  value: 30,
                  child: Center(
                      child: Text('30',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                          )))),
              DropdownMenuItem(
                  value: 40,
                  child: Center(
                      child: Text('40',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                          )))),
              DropdownMenuItem(
                  value: 50,
                  child: Center(
                      child: Text('50',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                          )))),
              DropdownMenuItem(
                  value: 100,
                  child: Center(
                      child: Text('100',
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFFCCCCCC)
                                    : const Color(0xFF1A1A1A),
                          )))),
            ],
            onChanged: (value) {
              setState(() {
                _itemsPerPage = value!;
                widget.onItemsPerPageChanged(_itemsPerPage);
              });
            },
            underline: const SizedBox(),
            focusColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
