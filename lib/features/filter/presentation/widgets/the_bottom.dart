import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/filter_cubit.dart';

class TheBottomWidget extends StatefulWidget {
  const TheBottomWidget({Key? key}) : super(key: key);

  @override
  State<TheBottomWidget> createState() => _TheBottomWidgetState();
}

class _TheBottomWidgetState extends State<TheBottomWidget> {
  bool checkValue = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<FilterCubit>().getFilterResponse();
              },
              style: ElevatedButton.styleFrom(
                  maximumSize: Size.infinite,
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(30)),
                  minimumSize: const Size(300, 46),
                  backgroundColor: AppColors.primary),
              child: Text(translateText(AppStrings.searchText, context)),
            )
          ],
        );
      },
    );
  }
}
