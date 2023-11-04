import 'package:flutter/material.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';

class IrTrainTktsTab extends StatefulWidget {
  const IrTrainTktsTab({super.key});

  @override
  State<IrTrainTktsTab> createState() => _IrTrainTktsTabState();
}

class _IrTrainTktsTabState extends State<IrTrainTktsTab> {
  @override
  Widget build(BuildContext context) {
    return const CTextErrorWidget(
      text: 'Stay tuned for more exciting features.',
    );
  }
}
