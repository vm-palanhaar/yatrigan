import 'package:flutter/material.dart';
import 'package:yatrigan/view/util/app_bar.dart';
import 'package:yatrigan/view/util/margins.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  static String id = '/yatrigan/ir/help';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Help',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
