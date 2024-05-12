import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreButton extends StatelessWidget {
  final VoidCallback onTap;
  const MoreButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          children: [
            Container(
              color: Color(0xffb39689),
              child: SvgPicture.asset(
                'assets/icons/square_arrow.svg',
                width: 48,
              ),
            ),
            const Text(
              "더 알아보기",
              style: TextStyle(
                color: Color(0xff919191),
                fontSize: 17,
              ),
            ),
          ],
        )
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(12),
        //     gradient: const LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: [
        //         Color(0xFFdbcdc7),
        //         Color(0xffc7b1a8),
        //         Color(0xffa98879),
        //       ],
        //     ),
        //   ),
        //   child: const Column(
        //     children: [
        //       Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white),
        //       Text(
        //         "더 알아보기",
        //         style:
        //             TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
