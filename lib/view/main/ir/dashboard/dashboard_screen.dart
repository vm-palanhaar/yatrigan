import 'package:flutter/material.dart';
import 'package:yatrigan/view/util/app_bar.dart';
import 'package:yatrigan/view/util/margins.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static String id = '/yatrigan/ir/hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Dashboard',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: const Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Exciting new features coming soon.'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
