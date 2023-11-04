import 'package:flutter/material.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';

class IrTrainStatusTab extends StatefulWidget {
  const IrTrainStatusTab({super.key});

  @override
  State<IrTrainStatusTab> createState() => _IrTrainStatusTabState();
}

class _IrTrainStatusTabState extends State<IrTrainStatusTab> {
  @override
  Widget build(BuildContext context) {
    return const CTextErrorWidget(
      text: 'Stay tuned for more exciting features.',
    );
  }
}
