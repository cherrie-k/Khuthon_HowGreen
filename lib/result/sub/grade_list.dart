import 'package:flutter/material.dart';

class GradeList extends StatelessWidget {
  final Map<String, String> grades;

  const GradeList({super.key, required this.grades});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> displayData = [
      {"label": "ESG등급", "value": grades["grade"]!},
      {"label": "환경", "value": grades["environment"]!},
      {"label": "사회", "value": grades["social"]!},
      {"label": "지배구조", "value": grades["governance"]!},
    ];

    return LayoutBuilder(builder: (context, constraints) {
      double size = (constraints.maxWidth - 36) / 4; // 24 = 3 gaps * 12px 임
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (idx) {
          return Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: Color(0xFFe3e3e3),
              // color: Color(0xFFf5f5f5),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  displayData[idx]['value']!,
                  style: const TextStyle(
                    color: Color(0xFF48C2B7),
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  displayData[idx]['label']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6e6e6e),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        }),
      );
    });
  }
}
