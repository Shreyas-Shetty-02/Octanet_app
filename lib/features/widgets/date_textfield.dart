import 'package:flutter/material.dart';

class DateRangeField extends StatefulWidget {
  final TextEditingController controller;

  const DateRangeField({super.key, required this.controller});

  @override
  DateRangeFieldState createState() => DateRangeFieldState();
}

class DateRangeFieldState extends State<DateRangeField> {
  DateTimeRange? selectedDateRange;

  Future<void> selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.inputOnly,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFFCCCCCC))),
            datePickerTheme: DatePickerThemeData(
              headerForegroundColor: Color(0xFFCCCCCC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              backgroundColor: Color(0xFF1A1A1A),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
        widget.controller.text =
            '${picked.start.toString().split(' ')[0]} - ${picked.end.toString().split(' ')[0]}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          selectDateRange(context);
        },
        child: TextSelectionTheme(
          data: const TextSelectionThemeData(
            selectionColor: Color(0x33000000),
            selectionHandleColor: Color(0xFFCCCCCC),
          ),
          child: SizedBox(
            height: 50,
            child: AbsorbPointer(
              child: TextField(
                controller: widget.controller,
                cursorColor: const Color(0xFFFFFFFF),
                cursorWidth: 1,
                style: const TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  labelText: 'Date Range',
                  labelStyle: const TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: 14,
                  ),
                  filled: false,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF333333)),
                    borderRadius: BorderRadius.zero,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.zero,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0066FF)),
                    borderRadius: BorderRadius.zero,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 10,
                  ),
                ),
                obscureText: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
