import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, Routes.registerScreenRoute);
              },
              style: ElevatedButton.styleFrom(
                  maximumSize: Size.infinite,
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(8)
                  ),
                  minimumSize:  const Size(155, 56),
                  backgroundColor: AppColors.buttonBackground),
              child: const Text("Back"),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, Routes.registerScreenRoute);
              },
              style: ElevatedButton.styleFrom(
                  maximumSize: Size.infinite,
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(8)
                  ),
                  minimumSize:  const Size(155, 56),
                  backgroundColor: AppColors.primary),
              child: const Text("Start"),
            ),
          ),
        ],
      ),
    );
  }
}
