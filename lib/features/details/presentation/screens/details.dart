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
              HeaderWidget(itemImagesList:mainItemModel==null?[]: mainItemModel!.images!),
              const SizedBox(height: 12),
              const SimpleDetails(),
              const Divider(thickness: 1),
              const LocationWidget(),
              const Divider(thickness: 1),
              const AllDetails(),
              const Divider(thickness: 1),
              const AmenitiesWidget(),
              const Divider(thickness: 1),
              const OverViewWidget(),
              const Divider(thickness: 1),
              const ProvidedByWidget(),
              const Divider(thickness: 1),
              const BottomWidget(),
              const Divider(thickness: 1),
               PropertyWidget(mainItemModel: mainItemModel??MainItem()),
              const Divider(thickness: 1),
              const CommunicationWidget(),
              const Divider(thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}