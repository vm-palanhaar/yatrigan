import 'package:flutter/material.dart';
import 'package:yatrigan/view/util/app_bar.dart';
import 'package:yatrigan/view/util/margins.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';

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
      body: Container(
        margin: screenMargin(context),
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CTextErrorWidget(
              text: 'List all helpline numbers associated with Railways',
            ),
            CTextErrorWidget(
              text: 'Pending RailMadad Integration',
            ),
          ],
        ),
      ),
    );
  }
}
