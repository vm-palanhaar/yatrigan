import 'package:flutter/material.dart';
import 'package:yatrigan/view/main/ir/dashboard/widgets/search_opt_widget.dart';
import 'package:yatrigan/view/util/app_bar.dart';
import 'package:yatrigan/view/util/margins.dart';
import 'package:yatrigan/view/widgets/list_tile_row_widget.dart';

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
          child: Column(
            children: [
              const SearchOptWidget(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        title: const Text('The journey you are currently on\n'),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTileRowWidget(
                              title: 'PNR',
                              titleBold: true,
                              trailing: Text('2751709952'),
                            ),
                            ListTileRowWidget(
                              title: 'Train',
                              titleBold: true,
                              trailing: Text('NZM-CSMT RAJDHANI (22222)'),
                            ),
                            ListTileRowWidget(
                              title: 'From',
                              titleBold: true,
                              trailing: Text('HAZRAT NIZAMUDDIN JN - NZM'),
                            ),
                            ListTileRowWidget(
                              title: 'To',
                              titleBold: true,
                              trailing: Text('C SHIVAJI MAH T - CSMT'),
                            ),
                            ListTileRowWidget(
                              title: 'E.T.A.',
                              titleBold: true,
                              trailing: Text('05th Nov 2023  11:15 HRS'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
