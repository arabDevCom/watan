import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class RadioChooseWidget extends StatefulWidget {
  const RadioChooseWidget({Key? key}) : super(key: key);

  @override
  State<RadioChooseWidget> createState() => _RadioChooseWidgetState();
}
enum FurnishedChoose { yes, no }

class _RadioChooseWidgetState extends State<RadioChooseWidget> {
   FurnishedChoose? _choose  = FurnishedChoose.yes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Yes'),
          leading: Radio<FurnishedChoose>(
            activeColor: AppColors.primary,
            value: FurnishedChoose.yes,
            groupValue: _choose,
            onChanged: (FurnishedChoose? value) {
              setState(() {
                _choose = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No'),
          leading: Radio<FurnishedChoose>(
            activeColor: AppColors.primary,
            value: FurnishedChoose.no,
            groupValue: _choose,
            onChanged: (FurnishedChoose? value) {
              setState(() {
                _choose = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
