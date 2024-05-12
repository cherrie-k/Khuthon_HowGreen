import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemTile extends StatelessWidget {
  final String productImg;
  final String productName;
  final String companyName;
  final bool isGood;

  const ItemTile({
    super.key,
    required this.productImg,
    required this.productName,
    required this.companyName,
    required this.isGood,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE9E9E9),
            width: 0.8,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              productImg,
              width: 98,
              height: 68,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: Theme.of(context).textTheme.bodySmall),
                Text(
                  companyName,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontStyle: FontStyle.italic,
                        color: const Color(0xFF626262),
                      ),
                ),
              ],
            ),
          ),
          isGood
              ? Image.asset('assets/images/yes_certification.png', width: 34)
              : const SizedBox.shrink(),
          const SizedBox(width: 2),
        ],
      ),
    );
  }
}
