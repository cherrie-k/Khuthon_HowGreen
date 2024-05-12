import 'package:flutter/material.dart';
import 'package:khuthon/widgets/gradient_text.dart';

AppBar mainAppbar({
  bool? showTitle = false,
  VoidCallback? onTapLeading,
  VoidCallback? onTapTrailing,
  bool? backgroundIsWhite = false,
}) {
  return AppBar(
    title: GradientText(
      'How Green?',
      style: TextStyle(
        fontSize: 24,
        // fontWeight: FontWeight.w200,
        fontFamily: 'Modak',
      ),
      gradient: backgroundIsWhite!
          ? LinearGradient(colors: [
              Color(0xFF5AC360),
              Color(0xFF48C2B7),
            ])
          : LinearGradient(
              colors: [Colors.white, Colors.white],
            ),
    ),
    // Text(
    //   showTitle! ? "GreenChecker" : '',
    //   style: TextStyle(
    //     fontSize: 24,
    //     color: backgroundIsWhite! ? Color(0xFF5AC360) : Colors.white,
    //     fontFamily: 'Pacifico',
    //   ),
    // ),
    centerTitle: true,
    toolbarHeight: 72,
    backgroundColor: Colors.transparent,
    leading: (onTapLeading != null)
        ? IconButton(
            iconSize: 24,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: backgroundIsWhite! ? Colors.grey : Colors.white,
            ),
            onPressed: onTapLeading,
          )
        : const SizedBox.shrink(),
    actions: [
      (onTapTrailing != null)
          ? IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.more_vert,
                color: backgroundIsWhite! ? Colors.grey : Colors.white,
              ),
              onPressed: onTapTrailing,
            )
          : const SizedBox.shrink()
    ],
  );
}
