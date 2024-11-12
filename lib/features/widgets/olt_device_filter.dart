import 'package:flutter/material.dart';

class OLTDeviceFilter extends StatefulWidget {
  const OLTDeviceFilter({super.key});

  @override
  State<OLTDeviceFilter> createState() => _OLTDeviceFilterState();
}

class _OLTDeviceFilterState extends State<OLTDeviceFilter> {
  bool isAllSelected = true;

  bool isPGNSSelected = false;
  bool isAllPGNSSelected = false;
  bool isPGNS1Selected = false;
  bool isPGNS2Selected = false;
  bool isPGNS3Selected = false;
  bool isPGNS4Selected = false;
  bool isPGNS5Selected = false;
  bool isPGNS6Selected = false;
  bool isPGNS7Selected = false;
  bool isPGNS8Selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF333333)),
              ),
              constraints: BoxConstraints.tightFor(height: 30, width: 60),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isAllSelected = true;
                    isPGNSSelected = false;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    isAllSelected
                        ? const Color(0xFF0066FF)
                        : const Color(0xFFFFFFFF),
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(
                    isAllSelected
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xBE000000),
                  ),
                  overlayColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 4),
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                ),
                child: const Text(
                  'All',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF333333)),
              ),
              constraints: BoxConstraints.tightFor(height: 30, width: 60),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isAllSelected = false;
                    isPGNSSelected = true;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    isPGNSSelected
                        ? const Color(0xFF0066FF)
                        : const Color(0xFFFFFFFF),
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(
                    isPGNSSelected
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xBE000000),
                  ),
                  overlayColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 4),
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                ),
                child: const Text(
                  'PGNS',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (isPGNSSelected) ...[
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                constraints: BoxConstraints.tightFor(height: 30, width: 40),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAllPGNSSelected = true;
                      isPGNS1Selected = false;
                      isPGNS2Selected = false;
                      isPGNS3Selected = false;
                      isPGNS4Selected = false;
                      isPGNS5Selected = false;
                      isPGNS6Selected = false;
                      isPGNS7Selected = false;
                      isPGNS8Selected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      isAllPGNSSelected
                          ? const Color(0xFF0066FF)
                          : const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      isAllPGNSSelected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xBE000000),
                    ),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: const Text(
                    'All',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                constraints: BoxConstraints.tightFor(height: 30, width: 30),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAllPGNSSelected = false;
                      isPGNS1Selected = true;
                      isPGNS2Selected = false;
                      isPGNS3Selected = false;
                      isPGNS4Selected = false;
                      isPGNS5Selected = false;
                      isPGNS6Selected = false;
                      isPGNS7Selected = false;
                      isPGNS8Selected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      isPGNS1Selected
                          ? const Color(0xFF0066FF)
                          : const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      isPGNS1Selected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xBE000000),
                    ),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                constraints: BoxConstraints.tightFor(height: 30, width: 30),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAllPGNSSelected = false;
                      isPGNS1Selected = false;
                      isPGNS2Selected = true;
                      isPGNS3Selected = false;
                      isPGNS4Selected = false;
                      isPGNS5Selected = false;
                      isPGNS6Selected = false;
                      isPGNS7Selected = false;
                      isPGNS8Selected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      isPGNS2Selected
                          ? const Color(0xFF0066FF)
                          : const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      isPGNS2Selected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xBE000000),
                    ),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                constraints: BoxConstraints.tightFor(height: 30, width: 30),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAllPGNSSelected = false;
                      isPGNS1Selected = false;
                      isPGNS2Selected = false;
                      isPGNS3Selected = true;
                      isPGNS4Selected = false;
                      isPGNS5Selected = false;
                      isPGNS6Selected = false;
                      isPGNS7Selected = false;
                      isPGNS8Selected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      isPGNS3Selected
                          ? const Color(0xFF0066FF)
                          : const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      isPGNS3Selected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xBE000000),
                    ),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                constraints: BoxConstraints.tightFor(height: 30, width: 30),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAllPGNSSelected = false;
                      isPGNS1Selected = false;
                      isPGNS2Selected = false;
                      isPGNS3Selected = false;
                      isPGNS4Selected = true;
                      isPGNS5Selected = false;
                      isPGNS6Selected = false;
                      isPGNS7Selected = false;
                      isPGNS8Selected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      isPGNS4Selected
                          ? const Color(0xFF0066FF)
                          : const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      isPGNS4Selected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xBE000000),
                    ),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                constraints: BoxConstraints.tightFor(height: 30, width: 30),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAllPGNSSelected = false;
                      isPGNS1Selected = false;
                      isPGNS2Selected = false;
                      isPGNS3Selected = false;
                      isPGNS4Selected = false;
                      isPGNS5Selected = true;
                      isPGNS6Selected = false;
                      isPGNS7Selected = false;
                      isPGNS8Selected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      isPGNS5Selected
                          ? const Color(0xFF0066FF)
                          : const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      isPGNS5Selected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xBE000000),
                    ),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: const Text(
                    '5',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                constraints: BoxConstraints.tightFor(height: 30, width: 30),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAllPGNSSelected = false;
                      isPGNS1Selected = false;
                      isPGNS2Selected = false;
                      isPGNS3Selected = false;
                      isPGNS4Selected = false;
                      isPGNS5Selected = false;
                      isPGNS6Selected = true;
                      isPGNS7Selected = false;
                      isPGNS8Selected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      isPGNS6Selected
                          ? const Color(0xFF0066FF)
                          : const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      isPGNS6Selected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xBE000000),
                    ),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                constraints: BoxConstraints.tightFor(height: 30, width: 30),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAllPGNSSelected = false;
                      isPGNS1Selected = false;
                      isPGNS2Selected = false;
                      isPGNS3Selected = false;
                      isPGNS4Selected = false;
                      isPGNS5Selected = false;
                      isPGNS6Selected = false;
                      isPGNS7Selected = true;
                      isPGNS8Selected = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      isPGNS7Selected
                          ? const Color(0xFF0066FF)
                          : const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      isPGNS7Selected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xBE000000),
                    ),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: const Text(
                    '7',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                constraints: BoxConstraints.tightFor(height: 30, width: 30),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isAllPGNSSelected = false;
                      isPGNS1Selected = false;
                      isPGNS2Selected = false;
                      isPGNS3Selected = false;
                      isPGNS4Selected = false;
                      isPGNS5Selected = false;
                      isPGNS6Selected = false;
                      isPGNS7Selected = false;
                      isPGNS8Selected = true;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      isPGNS8Selected
                          ? const Color(0xFF0066FF)
                          : const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      isPGNS8Selected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xBE000000),
                    ),
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 4),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: const Text(
                    '8',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
