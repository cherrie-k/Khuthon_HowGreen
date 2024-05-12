import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khuthon/result/more_info_sheet.dart';
import 'package:khuthon/result/sub/good_bad_info_area.dart';
import 'package:khuthon/result/sub/grade_list.dart';
import 'package:khuthon/result/sub/more_button.dart';
import 'package:khuthon/widgets/appbar.dart';
import 'package:khuthon/widgets/gradient_text.dart';

class ResultPage extends StatefulWidget {
  final dynamic data;

  const ResultPage({super.key, this.data});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  // dynamic _data ;
  double _imgWidth = 280;


  @override
  void initState() {
    super.initState();
    // _data = widget.data;
    Future.delayed(Duration.zero, () {
      setState(() {
        _imgWidth = 140;
      });
    });
    // _controller.forward();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _showInitialBottomSheet();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final dynamic data = widget.data;

    final bool esgGradeExists = true;
    final String companyName = data['company'];
    final String productName = data['product'];
    final Map<String, String> grades = {
      "company": companyName,
      "grade": data['grade'],
      "environment": data['environment'],
      "social": data['social'],
      "governance": data['governce'],
      // "year": "2023"  // todo: 평가년도
    };
    final bool isCertified = data['certified'];
    // final List<Map<String, dynamic>> keywords = data['keywords'];
    // keywords = List<Map<String, dynamic>>.from(data['keywords']);
    // final List<Map<String, dynamic>> keywords = data['keywords'];
    final List<Map<String, dynamic>> keywords = List<Map<String, dynamic>>.from(widget.data['keywords']);
    final List<Map<String, dynamic>> articles = List<Map<String, dynamic>>.from(widget.data['articles']);
    final List<Map<String, dynamic>> esgs = List<Map<String, dynamic>>.from(widget.data['esgs']);



    void openBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return MoreInfoSheet(articleDatas: articles, esgsDatas: esgs,);
        },
      );
    }

    String applyCorrectParticle(String productName) {
      String lastChar = productName.characters.last;
      int code = lastChar.codeUnitAt(0);

      const int HANGUL_START = 0xAC00;
      const int HANGUL_END = 0xD7A3;

      if (code >= HANGUL_START && code <= HANGUL_END) {
        int index = code - HANGUL_START;

        const int NUM_FINALS = 28;

        if ((index % NUM_FINALS) > 0) {
          return "$productName은";
        }
      }
      return "$productName는";
    }

    return Scaffold(
      backgroundColor: const Color(0xFFfdfdfd),
      appBar: mainAppbar(
        onTapLeading: () =>
            Navigator.popUntil(context, (route) => route.isFirst),
        backgroundIsWhite: true,
        onTapTrailing: () {},
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  '$companyName ${applyCorrectParticle(productName)}...',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF494949),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                animatedResult(isCertified: isCertified),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isCertified ? '친환경 인증을 받았어요  ' : '친환경 인증 정보를 찾지 못했어요  ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF616161),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SvgPicture.asset('assets/icons/leaf.svg', width: 18),
                  ],
                ),
                const SizedBox(height: 32),
                const SizedBox(
                  width: double.infinity,
                  child: GradientText(
                    '한국 ESG 기준원 기업 등급:',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF5AC360),
                        Color(0xFF48C2B7),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GradeList(grades: grades),
                const SizedBox(height: 40),
                GoodBadInfoArea(datas: keywords,),
                const SizedBox(height: 24),
                MoreButton(onTap: openBottomSheet),
                // InkWell(
                //   child: Text("버튼이 못생겨서 너무 화가 나"),
                //   onTap: () {
                //     Navigator.of(context).pushNamed("/result");
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget animatedResult({required bool isCertified}) {
    return SizedBox(
      width: double.infinity,
      height: 124,
      child: Center(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 1600),
            curve: Curves.elasticOut,
            width: _imgWidth,
            child: isCertified
                ? Image.asset('assets/images/yes_certification.png')
                : SvgPicture.asset('assets/images/no_certification.svg')
            // Image.asset(resultImg),
            ),
      ),
    );
  }
}

// class StuckBottomSheet extends StatelessWidget {
//   const StuckBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     return DraggableScrollableSheet(
//       initialChildSize: 0.5,
//       minChildSize: 0.5,
//       maxChildSize: (screenHeight - 74) / screenHeight,
//       builder: (BuildContext context, ScrollController scrollController) {
//         return Container(
//           color: Colors.blue[100],
//           child: ListView.builder(
//             controller: scrollController,
//             itemCount: 25,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(title: Text('Item $index'));
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// void _showInitialBottomSheet() {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     // barrierColor: Colors.white.withOpacity(0),
//     builder: (BuildContext context) {
//       double sh = MediaQuery.of(context).size.height;
//       double maxChildSize = (sh - 72) / sh; // 72는 앱바높이..가 아니라 다시 계산해야 함
//       double minChildSize = (sh - 72 - 88 - 26 - 240) / sh; // 얘도 다시 계산
//       return DraggableScrollableSheet(
//         snap: true,
//         shouldCloseOnMinExtent: false,
//         expand: false,
//         initialChildSize: minChildSize,
//         minChildSize: minChildSize,
//         maxChildSize: maxChildSize,
//         builder: (BuildContext context, ScrollController scrollController) {
//           return Container(
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//             child: Column(
//               children: [
//                 Container(
//                   height: 6,
//                   width: 32,
//                   decoration: BoxDecoration(
//                     color: Colors.black12,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//                 const SizedBox(height: 28),
//                 Text('이 부분 디자인 개똥같은거 일단 무시해주셈', style: TextStyle(fontSize: 18),),
//                 Text('백에서 오는 데이터 형태 픽스되고 난 다음에 고칠거임'),
//                 const SizedBox(height: 28),
//                 const Expanded(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     '좋아요!',
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   SizedBox(width: 5),
//                                   Icon(Icons.energy_savings_leaf),
//                                 ],
//                               ),
//                               const SizedBox(height: 4),
//                               Text('- blah blah',
//                                   style: TextStyle(fontSize: 16)),
//                               Text('- blah blah 2',
//                                   style: TextStyle(fontSize: 16)),
//                               Text('- blah blah 3',
//                                   style: TextStyle(fontSize: 16)),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     '아쉬워요!',
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   const SizedBox(width: 5),
//                                   Icon(Icons.energy_savings_leaf),
//                                 ],
//                               ),
//                               const SizedBox(height: 4),
//                               Text('- blah blah',
//                                   style: TextStyle(fontSize: 16)),
//                               Text('- blah blah 2',
//                                   style: TextStyle(fontSize: 16)),
//                               Text('- blah blah 3',
//                                   style: TextStyle(fontSize: 16)),
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 38),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('더 알아보려면?', style: TextStyle(fontSize: 20)),
//                           SizedBox(height: 10),
//                           Text(
//                               '- It is a long established fact that a reader will be distracted by the readable content of',
//                               style: TextStyle(fontSize: 16)),
//                           Text(
//                               '- It is a long established fact that a reader will be distracted by the readable content of',
//                               style: TextStyle(fontSize: 16)),
//                           Text('- 잠만 근데 이거 살아있나?',
//                               style: TextStyle(fontSize: 16)),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }
