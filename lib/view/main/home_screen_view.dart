import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/init/init_view.dart';
import 'package:yatrigan/view/main/ir/dashboard/dashboard_screen.dart';
import 'package:yatrigan/view/main/ir/help/help_screen.dart';
import 'package:yatrigan/view/main/ir/station/ir_station_screen.dart';
import 'package:yatrigan/view/main/ir/train/train_screen.dart';
import 'package:yatrigan/view/main/ir/wallet/wallet_screen.dart';
import 'package:yatrigan/view/main/util/bottom_nav_bar_util.dart';
import 'package:yatrigan/view/main/util/internet_screen.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});
  static String id = '/idukaan/home/init';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IrCtrl()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          // indian railways
          IrStationScreen.id: (_) => const IrStationScreen(),
          // user login/logout
          InitView.id: (_) => const InitView(),
          // utility Screen
          InternetScreen.id: (_) => const InternetScreen(),
        },
        home: DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: Builder(builder: (context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                setState(() {});
              }
            });
            return Scaffold(
              body: TabBarView(
                controller: tabController,
                children: const <Widget>[
                  DashboardScreen(),
                  TrainScreen(),
                  WalletScreen(),
                  HelpScreen(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: tabController.index,
                onTap: (index) {
                  setState(() {
                    tabController.index = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.dashboard.icon,
                    label: BottomNavBarUtil.dashboard.label,
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.train.icon,
                    label: BottomNavBarUtil.train.label,
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.wallet.icon,
                    label: BottomNavBarUtil.wallet.label,
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.help.icon,
                    label: BottomNavBarUtil.help.label,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
