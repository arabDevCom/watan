import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/translate_text_method.dart';

class RadioChooseWidget extends StatefulWidget {
  const RadioChooseWidget({Key? key}) : super(key: key);

  @override
  State<RadioChooseWidget> createState() => _RadioChooseWidgetState();
}

enum FurnishedChoose { yes, no }

class _RadioChooseWidgetState extends State<RadioChooseWidget> {
  FurnishedChoose? _choose;

  @override
  void initState() {
    super.initState();
    if (context.read<AddAdsCubit>().btnText == 'update') {
      if (context.read<AddAdsCubit>().furnished == 0) {
        _choose = FurnishedChoose.no;
      } else {
        _choose = FurnishedChoose.yes;
      }
    } else {
      _choose = FurnishedChoose.yes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            translateText(
              AppStrings.yesText,
              context,
            ),
          ),
          leading: Radio<FurnishedChoose>(
            activeColor: AppColors.primary,
            value: FurnishedChoose.yes,
            groupValue: _choose,
            onChanged: (FurnishedChoose? value) {
              setState(
                () {
                  _choose = value;
                  context.read<AddAdsCubit>().furnished = 1;
                },
              );
            },
          ),
        ),
        ListTile(
          title: Text(
            translateText(
              AppStrings.noText,
              context,
            ),
          ),
          leading: Radio<FurnishedChoose>(
            activeColor: AppColors.primary,
            value: FurnishedChoose.no,
            groupValue: _choose,
            onChanged: (FurnishedChoose? value) {
              setState(
                () {
                  _choose = value;
                  context.read<AddAdsCubit>().furnished = 0;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
