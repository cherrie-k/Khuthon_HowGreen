import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khuthon/loading/sub/inner_shadow_container.dart';
import 'package:khuthon/loading/sub/loading_widget.dart';
import 'package:khuthon/result/result_page.dart';
import 'package:khuthon/services/api_service.dart';
import 'package:khuthon/widgets/appbar.dart';
import 'package:khuthon/widgets/custom_scaffold.dart';
import 'package:khuthon/widgets/minor_ui_components.dart';
// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class LoadingPage extends StatefulWidget {
  final String company;
  final String product;
  const LoadingPage({super.key, required this.company, required this.product});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final List<String> infoTexts = [
    '그거 아셨나요? 지구의 날은 4월 22일 이에요.',
    '''구글은 4년 연속 100% 재생 에너지
    사용 목표를 달성했어요.''',
    "2020년 9월 세계경제포럼은 '이해관계자 자본주의 측정 지표'라는 ESG 평가 방법을 발표했어요.",
    "그린 택소노미란, 특정 기술이나 산업활동에 사용되는 에너지원이 친환경인지 아닌지를 결정하는 기준을 뜻해요.",
  ];

  int _currentIndex = 0; // 나뭇잎 세 개 밑에 텍스트 전환용임
  Timer? _timer;
  // Timer? _redirectTimer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 3400), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % infoTexts.length;
      });
    });
    fetchDataAndNavigate();
    // _redirectTimer = Timer(Duration(seconds: 6), () {
    //   //Navigator.of(context).pushNamed("/result");
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultPage(data: widget.data)));
    // });
  }

  void fetchDataAndNavigate() async {
    ApiService apiService = ApiService();
    try {
      Map<String, dynamic> data = {'company': widget.company, 'product': widget.product};
      var response = await apiService.postData(data);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultPage(data: response)));
    } catch (e) {
      log('Error posting data: $e');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    // _redirectTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: mainAppbar(
        showTitle: true,
        onTapLeading: () => Navigator.of(context).pop(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  'Analyzing...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/icons/leaf.svg', width: 18),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
              child: InnerShadowContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                const LoadingWidget(),
                const SizedBox(height: 120),
                tripleLeafDeco(),
                const SizedBox(height: 16),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Container(
                    height: 82,
                    child: Text(
                      infoTexts[_currentIndex],
                      key: ValueKey<int>(_currentIndex),
                      style: TextStyle(
                        color: Color(0xff595959),
                        fontSize: 17.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
