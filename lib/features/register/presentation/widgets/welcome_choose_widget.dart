import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/register_cubit.dart';

class WelcomeChooseWidget extends StatelessWidget {
   const WelcomeChooseWidget({
    Key? key,
    required this.title,
    required this.dec,
    required this.image, required this.index,
  }) : super(key: key);

  final String title;
  final String dec;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: null,
          height: 145,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: context.read<RegisterCubit>().userType == index
                    ? AppColors.primary
                    : context.read<RegisterCubit>().userType == index
                    ? AppColors.primary
                    : context.read<RegisterCubit>().userType == index
                    ? AppColors.primary
                    : AppColors.transparent,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          dec,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(image),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}
