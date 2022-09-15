import 'package:elwatn/features/home_page/domain/entities/main_item_domain_model.dart';
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
  const DetailsScreen({Key? key, this.mainItemModel}) : super(key: key);

  final MainItem? mainItemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              HeaderWidget(mainItem: mainItemModel!),
              const SizedBox(height: 12),
              SimpleDetails(mainItemModel: mainItemModel),
              const Divider(thickness: 1),
              LocationWidget(mainItemModel: mainItemModel),
              const Divider(thickness: 1),
              AllDetails(mainItemModel: mainItemModel),
              const Divider(thickness: 1),
              AmenitiesWidget(mainItemModel: mainItemModel),
              const Divider(thickness: 1),
              OverViewWidget(mainItemModel: mainItemModel),
              const Divider(thickness: 1),
              ProvidedByWidget(mainItemModel: mainItemModel),
              const Divider(thickness: 1),
              const BottomWidget(),
              const Divider(thickness: 1),
              PropertyWidget(mainItemModel: mainItemModel ?? MainItem()),
              const Divider(thickness: 1),
              CommunicationWidget(mainItemModel: mainItemModel),
              const Divider(thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}
