import 'package:flutter/material.dart';
import 'package:yatrigan/view/widgets/text_widget.dart';

class ListTileRowWidget extends StatelessWidget {
  final String title;
  final bool? titleBold;
  final Widget trailing;
  final Function? onTap;
  const ListTileRowWidget({
    super.key,
    required this.title,
    required this.trailing,
    this.titleBold,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Card(
        elevation: 0,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.002,
            horizontal: MediaQuery.of(context).size.width * 0.011,
          ),
          child: Row(
            children: [
              TextWidget(
                text: title,
                fontSize: MediaQuery.of(context).size.height * 0.017,
                fontWeight: titleBold == null ? null : FontWeight.bold,
              ),
              const Spacer(),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
