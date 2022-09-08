import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../features/home_page/presentation/widgets/dotes.dart';
import '../utils/assets_manager.dart';

// ignore: must_be_immutable
class BannerWidget extends StatefulWidget {
   const BannerWidget({Key? key,this.isDotes=true}) : super(key: key);

  final bool isDotes;
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
        items: [
          ImageAssets.image,
          ImageAssets.image2,
          ImageAssets.image3
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset(i,
                fit:BoxFit.fill,
              );
            },
          );
        }).toList(),
      ),
      widget.isDotes==true?const SizedBox(height: 18):const SizedBox(height:0),
      widget.isDotes==true?DotesWidget(page: page):Container(),
    ],);
  }
}
