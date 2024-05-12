// import 'package:flutter/material.dart';
//
// class GradeBox extends StatelessWidget {
//   const GradeBox({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double size = (MediaQuery.of(context).size.width - 24 * 2) / 4;
//
//     return Container(
//       width: size,
//       height: size,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             displayData[index]['label']!,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             displayData[index]['value']!,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
