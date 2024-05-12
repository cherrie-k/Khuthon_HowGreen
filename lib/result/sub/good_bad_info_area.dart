import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoodBadInfoArea extends StatelessWidget {
  final List<Map<String, dynamic>> datas;

  const GoodBadInfoArea({super.key, required this.datas});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> keywords = datas;
    // [
    //   {
    //     "keyword": "어쩌구 저쩌구 뉴스 기사 제목 2222",
    //     "result_id": 23,
    //   },
    //   {
    //     "keyword": "어쩌구 저쩌구 ㅣㅁㅇㄴㅁ ㅁㄹ ㅁㄴㄹ ㅁ아",
    //     "result_id": 23,
    //   },
    //   {
    //     "keyword": "어쩌구 저쩌구 뉴스 기사 제목",
    //     "result_id": 23,
    //   },
    //   {
    //     "keyword": "어쩌구 저쩌구 뉴스 기사 제목 3",
    //     "result_id": 23,
    //   },
    //   {
    //     "keyword": "어쩌구",
    //     "result_id": 23,
    //   },
    // ];

    final List<Map<String, dynamic>> shortKeywords = [];
    final List<Map<String, dynamic>> longKeywords = [];

    for (final keyword in keywords) {
      if (keyword['keyword'].length < 4) {
        shortKeywords.add(keyword);
      } else {
        longKeywords.add(keyword);
      }
    }

    longKeywords
        .sort((a, b) => b['keyword'].length.compareTo(a['keyword'].length));

    final List<Widget> keywordsWidgets = [];

    if (shortKeywords.isNotEmpty) {
      keywordsWidgets.addAll(shortKeywords.map((keyword) {
        return eachInfo(keyword['keyword']);
      }));
    }

    int count = 0;
    for (final keyword in longKeywords) {
      if (count < 3) {
        keywordsWidgets.add(eachInfo(keyword['keyword']));
        count++;
      } else {
        break;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5AC360), Color(0xFF48C2B7)],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFeeeeee),
            blurRadius: 20,
            spreadRadius: 0.4,
            blurStyle: BlurStyle.solid,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title('이런 점이 좋아요!'),
          const SizedBox(height: 10),
          Column(
            children: keywordsWidgets,
          ),
        ],
      ),
    );
  }

  // Widget divider() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 12),
  //     height: 150,
  //     width: 1,
  //     color: Colors.white,
  //   );
  // }

  Widget title(String title) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.energy_savings_leaf,
            color: Colors.white,
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

  Widget eachInfo(String detail) {
    TextStyle infoTextStyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('•', style: infoTextStyle),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              detail,
              style: infoTextStyle,
            ),
          )
        ],
      ),
    );
  }
}

// Widget build(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(32),
//       gradient: const LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [Color(0xFF5AC360), Color(0xFF48C2B7)],
//       ),
//       boxShadow: [
//         BoxShadow(
//           color: Color(0xFFeeeeee),
//           blurRadius: 20,
//           spreadRadius: 0.4,
//           blurStyle: BlurStyle.solid,
//         ),
//       ],
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               title('좋아요!'),
//               const SizedBox(height: 4),
//               eachInfo('blah blah 1'),
//               eachInfo('blah blah 2'),
//               eachInfo('blah blah 3'),
//             ],
//           ),
//         ),
//         divider(),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               title('아쉬워요!'),
//               const SizedBox(height: 4),
//               eachInfo('blah blah'),
//               eachInfo('hello my name is hi bye nice to meet you'),
//               eachInfo('blah blah 3'),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
