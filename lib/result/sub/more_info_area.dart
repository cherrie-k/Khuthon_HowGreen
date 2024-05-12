import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreInfoArea extends StatelessWidget {
  final List<Map<String, dynamic>> articleDatas;
  final List<Map<String, dynamic>> esgsDatas;

  const MoreInfoArea(
      {super.key, required this.articleDatas, required this.esgsDatas});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> articles = articleDatas;
    final List<Map<String, dynamic>> esgs = esgsDatas;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('제품 정보: ', style: TextStyle(
          ),),
          SizedBox(height: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              esgs.length,
                  (index) {
                return eachInfo2(
                  detail: esgs[index]['keyword']!,);
              },
            ),
          ),
          SizedBox(height: 20,),
          Text('관련 기사: ', style: TextStyle(
          ),),
          SizedBox(height: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              articles.length,
                  (index) {
                return eachInfo(
                    detail: articles[index]['title']!,
                    url: articles[index]['url']!);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget eachInfo({required String detail, required String url}) {
    TextStyle infoTextStyle = const TextStyle(
      fontSize: 19,
      color: Color(0xff828282),
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('•', style: infoTextStyle),
          const Icon(Icons.link, color: Color(0xff595959),),
          const SizedBox(width: 8),
          Expanded(
            child: InkWell(
              child: Text(
                '"$detail"',
                style: infoTextStyle,
              ),
              onTap: () {
                launchUrl(Uri.parse(url));
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget eachInfo2({required String detail}) {
  TextStyle infoTextStyle = const TextStyle(
    fontSize: 19,
    color: Color(0xff828282),
    fontWeight: FontWeight.bold,
  );

  if (detail == '') {
    return SizedBox.shrink();
  } else {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('•', style: infoTextStyle),
          const Icon(Icons.check, color: Color(0xff595959),size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$detail',
              style: infoTextStyle,
            ),
          )
        ],
      ),
    );
  }

}
