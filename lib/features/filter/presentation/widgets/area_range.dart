import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets_manager.dart';
import '../cubit/filter_cubit.dart';

class AreaRangeWidget extends StatelessWidget {
  const AreaRangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        SvgPicture.asset(ImageAssets.areaGoldIcon,width: 20,height: 20,),
        const SizedBox(width: 10),
        const Text("Area Range",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
      ],),
      const SizedBox(height: 20),
      Row(children: [
        Expanded(
          child: TextFormField(
            controller: context.read<FilterCubit>().areaFromController,
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
            controller: context.read<FilterCubit>().areaToController,
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
