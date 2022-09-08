import 'package:flutter/material.dart';

import '../widgets/all_details.dart';
import '../widgets/amenities.dart';
import '../widgets/bottom.dart';
import '../widgets/communcation.dart';
import '../widgets/header.dart';
import '../widgets/location.dart';
import '../widgets/overview.dart';
import '../widgets/proparty.dart';
import '../widgets/provided_by.dart';
import '../widgets/simple_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const[
              HeaderWidget(),
              SizedBox(height: 12),
              SimpleDetails(),
              Divider(thickness: 1),
              LocationWidget(),
              Divider(thickness: 1),
              AllDetails(),
              Divider(thickness: 1),
              AmenitiesWidget(),
              Divider(thickness: 1),
              OverViewWidget(),
              Divider(thickness: 1),
              ProvidedByWidget(),
              Divider(thickness: 1),
              BottomWidget(),
              Divider(thickness: 1),
              PropertyWidget(),
              Divider(thickness: 1),
              CommunicationWidget(),
              Divider(thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}