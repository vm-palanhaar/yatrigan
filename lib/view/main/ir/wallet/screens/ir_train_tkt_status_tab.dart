import 'package:flutter/material.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';

class IrTrainTktStatusTab extends StatefulWidget {
  const IrTrainTktStatusTab({super.key});

  @override
  State<IrTrainTktStatusTab> createState() => _IrTrainTktStatusTabState();
}

class _IrTrainTktStatusTabState extends State<IrTrainTktStatusTab> {
  @override
  Widget build(BuildContext context) {
    return const CTextErrorWidget(
      text: 'Stay tuned for more exciting features.',
    );
  }
}
