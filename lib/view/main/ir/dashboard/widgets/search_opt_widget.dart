import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/main/ir/station/widgets/ir_station_search_widget.dart';
import 'package:yatrigan/view/main/ir/train/widgets/ir_trains_search_widget.dart';
import 'package:yatrigan/view/widgets/fields/textformfield_widget.dart';
import 'package:yatrigan/view/widgets/text_widget.dart';

class SearchOptWidget extends StatefulWidget {
  const SearchOptWidget({super.key});

  @override
  State<SearchOptWidget> createState() => _SearchOptWidgetState();
}

class _SearchOptWidgetState extends State<SearchOptWidget> {
  late IrCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<IrCtrl>(context, listen: false);
    ctrl.initDb();
    super.initState();
  }

  /*
  0 - PNR Enquiry
  1 - Know Your Train (KYT)
  2 - Know Your Station (KYS)
   */
  int index = 0;

  Widget _optWidget({
    required Function onTap,
    required String assetImagePath,
    required String title,
    required int idx,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = idx;
        });
        onTap();
      },
      child: Column(
        children: [
          Image.asset(
            assetImagePath,
            height: idx == index
                ? MediaQuery.of(context).size.height * 0.06
                : MediaQuery.of(context).size.height * 0.04,
          ),
          TextWidget(
            text: title,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _fieldWidget() {
    switch (index) {
      case 0:
        return TextFormFieldWidget(
          prefixWidget: const Icon(Icons.sync),
          keyboardType: TextInputType.number,
          labelText: 'PNR Number',
          onFieldSubmitted: () {},
        );
      case 1:
        return IrTrainSearchWidget(
          onSubmitted: () {},
          title: 'Train Number/Name',
        );
      case 2:
        return IrStationSearchWidget(
          onSubmitted: () {},
          title: 'Station Code/Name',
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _optWidget(
                onTap: () {},
                assetImagePath: 'assets/images/ir/pnr_status.png',
                title: 'Enquiry',
                idx: 0,
              ),
              _optWidget(
                onTap: () {},
                assetImagePath: 'assets/images/ir/vande_bharat_white.png',
                title: 'KYT',
                idx: 1,
              ),
              _optWidget(
                onTap: () {},
                assetImagePath: 'assets/images/ir/station_board_new.png',
                title: 'KYS',
                idx: 2,
              ),
            ],
          ),
          const Spacer(),
          _fieldWidget(),
        ],
      ),
    );
  }
}
