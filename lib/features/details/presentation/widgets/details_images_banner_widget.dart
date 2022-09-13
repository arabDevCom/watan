import 'package:carousel_slider/carousel_slider.dart';
import 'package:elwatn/core/widgets/network_image.dart';
import 'package:flutter/material.dart';

import '../../../home_page/domain/entities/main_item_domain_model.dart';
import '../../../home_page/presentation/widgets/dotes.dart';

// ignore: must_be_immutable
class DetailsBannerWidget extends StatefulWidget {
  const DetailsBannerWidget({Key? key, this.isDotes = true, required this.imagesBanner})
      : super(key: key);
  final List<ItemImages> imagesBanner;
  final bool isDotes;

  @override
  State<DetailsBannerWidget> createState() => _DetailsBannerWidgetState();
}

class _DetailsBannerWidgetState extends State<DetailsBannerWidget> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              onPageChanged: (int i, CarouselPageChangedReason c) {
                setState(() {
                  page = i;
                });
              },
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true,
              height: MediaQuery.of(context).size.height * 0.25,
              reverse: false,
              viewportFraction: 1.0),
          items: widget.imagesBanner.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ManageNetworkImage(imageUrl: i.attachment!);
              },
            );
          }).toList(),
        ),
        widget.isDotes == true
            ? const SizedBox(height: 18)
            : const SizedBox(height: 0),
        widget.isDotes == true
            ? DotesWidget(
          page: page,
          length: widget.imagesBanner.length,
        )
            : Container(),
      ],
    );
  }
}
