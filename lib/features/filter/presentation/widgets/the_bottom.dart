import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class TheBottomWidget extends StatefulWidget {
  const TheBottomWidget({Key? key}) : super(key: key);

  @override
  State<TheBottomWidget> createState() => _TheBottomWidgetState();
}

class _TheBottomWidgetState extends State<TheBottomWidget> {
  bool checkValue=true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text("Properties With Video"),
          value: checkValue,
          activeColor: AppColors.primary,
          onChanged: (newValue) {
            setState(() {
              checkValue=newValue!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              maximumSize: Size.infinite,
              shape: RoundedRectangleBorder( //to set border radius to button
                  borderRadius: BorderRadius.circular(30)
              ),
              minimumSize: const Size(300, 46),
              primary: AppColors.primary),
          child: const Text("Search"),
        )
      ],
    );
  }
}
