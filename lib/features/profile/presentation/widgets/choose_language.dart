import 'package:elwatn/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ChooseLanguageWidget extends StatefulWidget {
  const ChooseLanguageWidget({Key? key, required this.title, required this.image})
      : super(key: key);
  final String title;
  final String image;

  @override
  State<ChooseLanguageWidget> createState() => _ChooseLanguageWidgetState();
}

class _ChooseLanguageWidgetState extends State<ChooseLanguageWidget> {
  Color? changeColor;

  @override
  void initState() {
    changeColor = AppColors.buttonBackground;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (changeColor == AppColors.primary) {
            changeColor = AppColors.buttonBackground;
          } else {
            changeColor = AppColors.primary;
          }
        });
      },
      child: InputChip(
        backgroundColor: changeColor,
        deleteIcon:
            changeColor == AppColors.primary ? Icon(Icons.check) : SizedBox(),
        deleteIconColor: AppColors.white,
        label: Text(
          widget.title,
          style: TextStyle(color: AppColors.white),
        ),
        avatar: Image.asset(widget.image),
        onDeleted: () {
          // state.deleteChip(language);
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
