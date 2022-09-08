import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/body_profile.dart';
import '../widgets/header_profile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HeaderProfileWidget(),
        SizedBox(height: 30),
        BodyProfileWidget(kind: "office"),
      ],
    );
  }
}
