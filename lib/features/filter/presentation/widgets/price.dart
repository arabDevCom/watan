import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets_manager.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        SvgPicture.asset(ImageAssets.priceIcon,width: 20,height: 20,),
        const SizedBox(width: 10),
        const Text("Price",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
      ],),
      const SizedBox(height: 20),
      Row(children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: "0"
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 25),
        const Text("To",style: TextStyle(fontSize: 12),),
        const SizedBox(width: 25),
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: "any"
            ),
          ),
        ),
      ],)

    ],);
  }
}
