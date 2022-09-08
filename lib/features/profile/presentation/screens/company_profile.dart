import 'package:flutter/material.dart';

import '../widgets/body_profile.dart';
import '../widgets/header_profile.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: const[
        HeaderProfileWidget(),
        SizedBox(height: 50),
        BodyProfileWidget(),
      ],
    );
  }
}
