import 'package:flutter/material.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';

class IrTrainHelpTab extends StatefulWidget {
  const IrTrainHelpTab({super.key});

  @override
  State<IrTrainHelpTab> createState() => _IrTrainHelpTabState();
}

class _IrTrainHelpTabState extends State<IrTrainHelpTab> {
  @override
  Widget build(BuildContext context) {
    return const CTextErrorWidget(
      text: 'Stay tuned for more exciting features.',
    );
  }
}
