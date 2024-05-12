// import 'package:flutter/material.dart';
//
// class SwitchingTextInfo extends StatelessWidget {
//   const SwitchingTextInfo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> dummyInfoTexts = [
//       '그거 아셨나요? 사실 어쩌구',
//       '얘도 바뀌고 이 위에 저 동그라미도 바껴서 넘 정신없을까봐 고민 흠 낼 더 생각해봐야겠음',
//       '오늘은 북극곰의 생일이에요~',
//       '김채리 최고짱~^*^',
//       '텍스트 전환이 넘 빨라도 문제고 넘 느려도 문제',
//     ];
//
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 500),
//       transitionBuilder:
//           (Widget child, Animation<double> animation) {
//         return FadeTransition(
//           opacity: animation,
//           child: child,
//         );
//       },
//       child: Text(
//         dummyInfoTexts[_currentIndex],
//         key: ValueKey<int>(_currentIndex),
//         style: TextStyle(
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
// }
