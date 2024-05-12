import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// 보통 핸들같은건 이렇게 위젯화하진 않고 바텀시트를 통채로 위젯화함

Container bottomSheetHandle(){
  return Container(
    height: 6,
    width: 32,
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(16),
    ),
  );
}

Widget tripleLeafDeco() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset('assets/icons/leaf.svg', width: 18),
      const SizedBox(width: 6),
      SvgPicture.asset('assets/icons/leaf.svg', width: 18),
      const SizedBox(width: 6),
      SvgPicture.asset('assets/icons/leaf.svg', width: 18),
    ],
  );
}