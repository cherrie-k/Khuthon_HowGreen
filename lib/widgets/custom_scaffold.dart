import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final Key? scaffoldKey;
  const CustomScaffold({super.key, required this.body, this.appBar, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            stops: [0.2, 0.5],
            end: Alignment.bottomRight,
            colors: [Color(0xFF5AC360), Color(0xFF48C2B7)],
          ),
        ),
        child: SafeArea(child: body, bottom: false),
      ),
    );
  }
}
