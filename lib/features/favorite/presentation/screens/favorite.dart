import 'package:flutter/material.dart';

import '../../../../core/widgets/scound_main_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(25, (index) => const SecondMainItemWidget(isFavorite: true,))
          ],
        ),
      ),
    );
  }
}
