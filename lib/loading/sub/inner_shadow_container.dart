import 'package:flutter/material.dart';

class InnerShadowContainer extends StatelessWidget {
  final Widget child;
  const InnerShadowContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFbebebe),
            blurRadius: 1,
            offset: Offset(0, -3),
            blurStyle: BlurStyle.solid,
          ),
          BoxShadow(
            color: Colors.white,
            spreadRadius: 0.2,
            blurStyle: BlurStyle.normal,
            blurRadius: 7,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: child,
    );
  }
}
