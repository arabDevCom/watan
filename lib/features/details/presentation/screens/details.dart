
import 'package:elwatn/features/home_page/domain/entities/main_item_domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/details_cubit.dart';
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

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, this.mainItemModel}) : super(key: key);

  final MainItem? mainItemModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  void initState() {
    super.initState();
    context
        .read<DetailsCubit>()
        .morePostsDetails(widget.mainItemModel!.id.toString());  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              HeaderWidget(mainItem: widget.mainItemModel!),
              const SizedBox(height: 12),
              SimpleDetails(mainItemModel: widget.mainItemModel),
              const Divider(thickness: 1),
              LocationWidget(mainItemModel: widget.mainItemModel),
              const Divider(thickness: 1),
              AllDetails(mainItemModel: widget.mainItemModel),
              const Divider(thickness: 1),
              AmenitiesWidget(mainItemModel: widget.mainItemModel),
              const Divider(thickness: 1),
              OverViewWidget(mainItemModel: widget.mainItemModel),
              const Divider(thickness: 1),
              ProvidedByWidget(mainItemModel: widget.mainItemModel),
              const Divider(thickness: 1),
              BottomWidget(mainProjectItemModel: null,mainItemModel: widget.mainItemModel,type: "ads"),
              const Divider(thickness: 1),
              PropertyWidget(
                mainItemModel: widget.mainItemModel ?? const MainItem(),
              ),
              const Divider(thickness: 1),
              CommunicationWidget(
                phone: widget.mainItemModel!.phone!,
                whatsapp: widget.mainItemModel!.whatsapp!,
                type: 'post',
                userId: widget.mainItemModel!.userId!,
                postId: widget.mainItemModel!.id!,
              ),
              const Divider(thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}
