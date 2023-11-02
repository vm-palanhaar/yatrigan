import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/widgets/fields/ac_textformfield_widget.dart';

class IrTrainSearchWidget extends StatefulWidget {
  final Function onSubmitted;
  final String title;
  const IrTrainSearchWidget({
    super.key,
    required this.onSubmitted,
    required this.title,
  });

  @override
  State<IrTrainSearchWidget> createState() => _IrTrainSearchWidgetState();
}

class _IrTrainSearchWidgetState extends State<IrTrainSearchWidget> {
  late IrCtrl ctrl;

  @override
  void initState() {
    ctrl = Provider.of<IrCtrl>(context, listen: false);
    getTrainList();
    super.initState();
  }

  Future<void> getTrainList() async {
    await ctrl.getTrainListApi(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AcTextFormFieldWidget(
      prefixWidget: const Icon(Icons.train_outlined),
      labelText: widget.title,
      list: ctrl.trainList!.trains,
      onSelect: (String selection) async {
        ctrl.trainNo = selection.split('-')[1].trim();
        ctrl.trainName = selection.split('-')[0].trim();
      },
    );
  }
}
