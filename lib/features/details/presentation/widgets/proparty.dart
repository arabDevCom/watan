import 'package:flutter/material.dart';

import '../../../../core/widgets/scound_main_item.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Text("Recommended Property"),
        ),
        const SizedBox(height: 16),
        ...List.generate(3, (index) => const SecondMainItemWidget())
      ],
    );
  }
}
