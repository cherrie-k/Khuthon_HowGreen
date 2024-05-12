import 'package:flutter/material.dart';
import 'package:khuthon/result/sub/more_info_area.dart';
import 'package:khuthon/widgets/minor_ui_components.dart';

class MoreInfoSheet extends StatelessWidget {
  final List<Map<String, dynamic>> articleDatas;
  final List<Map<String, dynamic>> esgsDatas;

  const MoreInfoSheet({super.key, required this.articleDatas, required this.esgsDatas});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          bottomSheetHandle(),
          const SizedBox(height: 50),
          Expanded(child: MoreInfoArea(articleDatas: articleDatas, esgsDatas: esgsDatas, )),
        ],
      ),
    );
  }
}
