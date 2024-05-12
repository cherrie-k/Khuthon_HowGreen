import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWaveSpinner(
        size: 140,
        trackColor: Color(0x805AC360),
        waveColor: Color(0x605AC360),
        color: Color(0xFF48C2B7),
      ),
    );
  }
}
