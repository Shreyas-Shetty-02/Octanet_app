import 'package:Octanet/features/widgets/map/icon_buttons.dart';
import 'package:flutter/material.dart';

void showBoxCoreDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.all(35),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF1A1A1A)
                  : const Color(0xFFFFFFFF),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF333333)
                            : const Color(0xFFE6E6E6),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: const Text(
                          'Box Core',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0066FF),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: bigCloseButton(context: context),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFCCCCCC),
                                ),
                                borderRadius: BorderRadius.zero),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Table(
                                  columnWidths: {
                                    0: FixedColumnWidth(130),
                                    1: FixedColumnWidth(60),
                                  },
                                  children: [
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildWireDropdown(context: context),
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFFEC1C24),
                                        ),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildWireDropdown(context: context),
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFF009345),
                                        ),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildWireDropdown(context: context),
                                        buildcolorbutton(
                                            context: context,
                                            color: Color(0xFFF16522)),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildWireDropdown(context: context),
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFF0066FF),
                                        ),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildWireDropdown(context: context),
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFFCCCCCC),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   width: 210,
                          //   height: 40,
                          //   margin: const EdgeInsets.all(10),
                          //   child: ButtonTheme(
                          //     alignedDropdown: true,
                          //     child: DropdownButtonFormField<String>(
                          //       value: 'empty',
                          //       dropdownColor: Theme.of(context).brightness ==
                          //               Brightness.dark
                          //           ? const Color(0xFF000000)
                          //           : const Color(0xFFFFFFFF),
                          //       borderRadius: BorderRadius.zero,
                          //       icon: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Image.asset(
                          //             'assets/Icons/dropdown_icon.png',
                          //             height: 12,
                          //             width: 12,
                          //             color: const Color(0xFFCCCCCC),
                          //           ),
                          //         ],
                          //       ),
                          //       style: TextStyle(
                          //           color: Theme.of(context).brightness ==
                          //                   Brightness.dark
                          //               ? const Color(0xFFFFFFFF)
                          //               : const Color(0xFF000000),
                          //           fontSize: 14),
                          //       decoration: InputDecoration(
                          //         enabledBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //             color: Theme.of(context).brightness ==
                          //                     Brightness.dark
                          //                 ? const Color(0xFF333333)
                          //                 : const Color(0xFFCCCCCC),
                          //           ),
                          //           borderRadius: BorderRadius.zero,
                          //         ),
                          //         disabledBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //             color: Theme.of(context).brightness ==
                          //                     Brightness.dark
                          //                 ? const Color(0xFF333333)
                          //                 : const Color(0xFFCCCCCC),
                          //           ),
                          //           borderRadius: BorderRadius.zero,
                          //         ),
                          //         focusedBorder: const OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //             color: Color(0xFF0066FF),
                          //           ),
                          //           borderRadius: BorderRadius.zero,
                          //         ),
                          //         contentPadding: EdgeInsets.only(right: 10),
                          //       ),
                          //       onChanged: (value) {},
                          //       items: [
                          //         DropdownMenuItem<String>(
                          //           value: 'empty',
                          //           child: Text(''),
                          //         ),
                          //         DropdownMenuItem<String>(
                          //           value: 'free',
                          //           child: Text('Free'),
                          //         ),
                          //         DropdownMenuItem<String>(
                          //           value: 'joined',
                          //           child: Text('Joined'),
                          //         ),
                          //         DropdownMenuItem<String>(
                          //           value: 'faulty',
                          //           child: Text('Faulty'),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFCCCCCC),
                                ),
                                borderRadius: BorderRadius.zero),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Table(
                                  columnWidths: {
                                    0: FixedColumnWidth(60),
                                    1: FixedColumnWidth(130),
                                  },
                                  children: [
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFFEC1C24),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFF009345),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFFF16522),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFF0066FF),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFFCCCCCC),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFCCCCCC),
                                ),
                                borderRadius: BorderRadius.zero),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Table(
                                  columnWidths: {
                                    0: FixedColumnWidth(60),
                                    1: FixedColumnWidth(130),
                                  },
                                  children: [
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFFEC1C24),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFF009345),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFFF16522),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFF0066FF),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                    TableRow(children: [
                                      SizedBox(height: 2.5),
                                      SizedBox(height: 2.5)
                                    ]),
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFF333333)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      children: [
                                        buildcolorbutton(
                                          context: context,
                                          color: Color(0xFFCCCCCC),
                                        ),
                                        buildWireDropdown(context: context),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget buildWireDropdown({required BuildContext context}) {
  return Container(
    height: 40,
    margin: EdgeInsets.all(5),
    child: ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<String>(
        value: 'free',
        dropdownColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.zero,
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Icons/dropdown_icon.png',
              height: 12,
              width: 12,
              color: const Color(0xFFCCCCCC),
            ),
          ],
        ),
        style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF000000),
            fontSize: 14),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF333333)
                  : const Color(0xFFCCCCCC),
            ),
            borderRadius: BorderRadius.zero,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF333333)
                  : const Color(0xFFCCCCCC),
            ),
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF0066FF),
            ),
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: EdgeInsets.only(right: 10),
        ),
        onChanged: (value) {},
        items: [
          DropdownMenuItem<String>(
            value: 'free',
            child: Text('Free'),
          ),
          DropdownMenuItem<String>(
            value: 'joined',
            child: Text('Joined'),
          ),
          DropdownMenuItem<String>(
            value: 'faulty',
            child: Text('Faulty'),
          ),
        ],
      ),
    ),
  );
}

Widget buildcolorbutton({required BuildContext context, required Color color}) {
  return Container(
    height: 40,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF333333)
            : const Color(0xFFCCCCCC),
      ),
    ),
    child: Container(
      margin: EdgeInsets.all(2.5),
      color: color,
    ),
  );
}
