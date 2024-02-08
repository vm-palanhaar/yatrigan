import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/main/ir/train/screens/ir_kyt_screen.dart';
import 'package:yatrigan/view/widgets/fields/ac_textformfield_widget.dart';
import 'package:yatrigan/view/widgets/loading_widget.dart';

class IrTrainSearchWidget extends StatefulWidget {
  final String title;
  const IrTrainSearchWidget({
    super.key,
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
    await ctrl.getSearchTrainList(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (ctrl.trainList != null) {
      return AcTextFormFieldWidget(
        prefixWidget: const Icon(Icons.train_outlined),
        labelText: widget.title,
        list: ctrl.trainList!.trains,
        onSelect: (String selection) async {
          ctrl.trainNo = selection.split('-')[0].trim();
          ctrl.trainName = selection.split('-')[1].trim();
          Navigator.pushNamed(context, IrKytScreen.id);
        },
      );
    }
    return const LoadingWidget();
  }
}
