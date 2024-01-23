import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/model/main/ir/train/schedule/ir_train_shdl_station_list_mdl.dart';
import 'package:yatrigan/view/main/ir/train/widgets/ir_train_shdl_station_widget.dart';
import 'package:yatrigan/view/util/margins.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';
import 'package:yatrigan/view/widgets/list_tile_row_widget.dart';
import 'package:yatrigan/view/widgets/loading_widget.dart';

class IrTrainShdlTab extends StatefulWidget {
  const IrTrainShdlTab({super.key});

  @override
  State<IrTrainShdlTab> createState() => _IrTrainShdlTabState();
}

class _IrTrainShdlTabState extends State<IrTrainShdlTab> {
  late IrCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<IrCtrl>(context, listen: false);
    getTrainShdl();
    super.initState();
  }

  Future<void> getTrainShdl() async {
    await ctrl.getTrainShdlApi(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (ctrl.trainShdl != null && ctrl.trainShdl!.trainNo == ctrl.trainNo) {
      if (ctrl.trainShdl!.shdl != null) {
        return RefreshIndicator(
          onRefresh: () async => await getTrainShdl(),
          child: Container(
            margin: screenMargin(context),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTileRowWidget(
                        title: 'Run on Days',
                        trailing: Text(ctrl.trainShdl!.shdl!.daysRun),
                        titleBold: true,
                      ),
                      ListTileRowWidget(
                        title: 'Duration',
                        trailing: Text(ctrl.trainShdl!.shdl!.duration),
                        titleBold: true,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            IrTrainShdlStationListMdl shdl =
                                ctrl.trainShdl!.shdl!.stations.elementAt(index);
                            return IrTrainShdlStationWidget(
                              key: ObjectKey(shdl),
                              station: shdl,
                            );
                          },
                          childCount: ctrl.trainShdl!.shdl!.stations.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (ctrl.trainShdl!.error != null) {
        return CTextErrorWidget(text: ctrl.trainShdl!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
