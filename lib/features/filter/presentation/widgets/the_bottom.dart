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
            CheckboxListTile(
              title: const Text("Properties With Video"),
              value: checkValue,
              activeColor: AppColors.primary,
              onChanged: (newValue) {
                setState(() {
                  checkValue = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            ElevatedButton(
              onPressed: () {
                print("status ${context.read<FilterCubit>().status}");
                print("city id ${context.read<FilterCubit>().cityId}");
                print("location id ${context.read<FilterCubit>().locationId}");
                print("currency ${context.read<FilterCubit>().currency}");
                print("agent id ${context.read<FilterCubit>().agentId}");
                print("price from ${context.read<FilterCubit>().priceFromController.text}");
                print("price To ${context.read<FilterCubit>().priceToController.text}");
                print("Area From ${context.read<FilterCubit>().areaFromController.text}");
                print("Area To ${context.read<FilterCubit>().areaToController.text}");
                print("bathroom ${context.read<FilterCubit>().bathroom}");
                print("bedroom ${context.read<FilterCubit>().bedroom}");
                print("type ${context.read<FilterCubit>().type}");
                print("-----------------------------------------");
                context.read<FilterCubit>().getFilterResponse();
              },
              style: ElevatedButton.styleFrom(
                  maximumSize: Size.infinite,
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(30)),
                  minimumSize: const Size(300, 46),
                  backgroundColor: AppColors.primary),
              child: const Text("Search"),
            )
          ],
        );
      },
    );
  }
}
