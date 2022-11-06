import 'dart:ui' as ui;

import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';

class OverViewWidget extends StatefulWidget {
  const OverViewWidget({Key? key, this.mainItemModel}) : super(key: key);
  final MainItem? mainItemModel;

  @override
  State<OverViewWidget> createState() => _OverViewWidgetState();
}

class _OverViewWidgetState extends State<OverViewWidget> {
  // late CameraPosition cameraPosition;
  // BitmapDescriptor? icon;
  //
  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  //
  // // CLASS MEMBER, MAP OF MARKS
  // void _add() {
  //   var markerIdVal = '1';
  //   final MarkerId markerId = MarkerId(markerIdVal);
  //
  //   // creating a new MARKER
  //   final Marker marker = Marker(
  //     markerId: markerId,
  //     icon: icon!,
  //     position: LatLng(
  //         widget.mainItemModel!.latitude!, widget.mainItemModel!.longitude!),
  //   );
  //
  //   setState(() {
  //     // adding a new marker to map
  //     markers[markerId] = marker;
  //   });
  // }
  //
  // static Future<Uint8List> getBytesFromAsset(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width, targetHeight: 128);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getBytesFromAsset(ImageAssets.markerImage, 135).then((onValue) {
  //     icon = BitmapDescriptor.fromBytes(onValue);
  //   }).whenComplete(() => _add());
  //
  //   // BitmapDescriptor.fromAssetImage(
  //   //         const ImageConfiguration(), ImageAssets.marksIcon)
  //   //     .then((value) => icon = value)
  //   //     .whenComplete(() => _add());
  // }

  @override
  Widget build(BuildContext context) {
    // cameraPosition = (widget.mainItemModel!.latitude != null &&
    //         widget.mainItemModel!.longitude != null)
    //     ? CameraPosition(
    //         target: LatLng(widget.mainItemModel!.latitude!,
    //             widget.mainItemModel!.longitude!),
    //         bearing: 0,
    //         tilt: 0,
    //         zoom: 17,
    //       )
    //     : const CameraPosition(target: LatLng(0, 0));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translateText(AppStrings.overviewText, context),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            width: MediaQuery.of(context).size.width,
            child: Text(
              IsLanguage.isEnLanguage(context)
                  ? widget.mainItemModel!.descriptionEn!
                  : (IsLanguage.isArLanguage(context)
                      ? widget.mainItemModel!.descriptionAr!
                      : widget.mainItemModel!.descriptionKu!),
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          // (widget.mainItemModel!.latitude != null &&
          //         widget.mainItemModel!.longitude != null)
          //     ? SizedBox(
          //         width: MediaQuery.of(context).size.width,
          //         height: 350,
          //         child: GoogleMap(
          //           mapType: MapType.normal,
          //           myLocationEnabled: true,
          //           zoomControlsEnabled: true,
          //           markers: Set<Marker>.of(markers.values),
          //           myLocationButtonEnabled: true,
          //           initialCameraPosition: cameraPosition,
          //         ),
          //       )
          //     : const SizedBox(height: 0),
          // const SizedBox(height: 18),
          // (widget.mainItemModel!.latitude != null &&
          //         widget.mainItemModel!.longitude != null)
          //     ? Row(
          //         children: [
          //           Expanded(
          //               child: Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 80),
          //             child: OutlinedButton(
          //                 style: OutlinedButton.styleFrom(
          //                   side: const BorderSide(
          //                       width: 1.5, color: Colors.grey),
          //                 ),
          //                 onPressed: () {},
          //                 child: Padding(
          //                   padding: const EdgeInsets.symmetric(vertical: 14),
          //                   child: Text(
          //                     translateText(
          //                         AppStrings.viewInMapTextBtn, context),
          //                     style: TextStyle(color: AppColors.black),
          //                   ),
          //                 )),
          //           )),
          //         ],
          //       )
          //     : const SizedBox(height: 0),
        ],
      ),
    );
  }
}
