import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  side: BorderSide.none,
                  primary: AppColors.buttonBackground),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text("Report This"),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  side: BorderSide.none,
                  primary: AppColors.primary),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text("All About Agent"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
