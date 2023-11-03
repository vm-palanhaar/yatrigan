import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/main/ir/station/screens/ir_kys_screen.dart';
import 'package:yatrigan/view/widgets/fields/ac_textformfield_widget.dart';

class IrStationSearchWidget extends StatefulWidget {
  final Function onSubmitted;
  final String title;
  const IrStationSearchWidget({
    super.key,
    required this.onSubmitted,
    required this.title,
  });

  @override
  State<IrStationSearchWidget> createState() => _IrStationSearchWidgetState();
}

class _IrStationSearchWidgetState extends State<IrStationSearchWidget> {
  late IrCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<IrCtrl>(context, listen: false);
    getStationList();
    super.initState();
  }

  Future<void> getStationList() async {
    await ctrl.getStationListApi(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AcTextFormFieldWidget(
      prefixWidget: const Icon(Icons.place_outlined),
      labelText: widget.title,
      list: ctrl.stationList!.stations,
      onSelect: (String selection) async {
        ctrl.stationName = selection.split('-')[0].trim();
        ctrl.stationCode = selection.split('-')[1].trim();
        Navigator.pushNamed(context, IrKysScreen.id);
      },
    );
  }
}
