import 'package:elwatn/config/routes/app_routes.dart';
import 'package:elwatn/features/home_page/presentation/widgets/home_item.dart';
import 'package:elwatn/features/new_added/presentation/screens/new_added.dart';
import 'package:elwatn/features/popular/presentation/screens/popular.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class HomeModelWidget extends StatelessWidget {
  const HomeModelWidget({Key? key, required this.kind}) : super(key: key);

  final String kind;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                kind.toUpperCase(),
                style: const TextStyle(fontSize: 12),
              )),
        ),
        const HomeItemWidget(),
        const HomeItemWidget(),
        ElevatedButton(
          onPressed: () {
            if(kind=="popular"){
              Navigator.push(context,MaterialPageRoute(builder: (context){return PopularScreen(kind: kind,);}));
            }else{
              Navigator.push(context,MaterialPageRoute(builder: (context){return NewAdded(kind: kind,);}));
            }
          },
          style: ElevatedButton.styleFrom(
              maximumSize: Size.infinite,
              minimumSize: const Size(300, 46),
              side: BorderSide.none,
              primary: AppColors.buttonBackground),
          child: const Text("View More"),
        ),
        const SizedBox(height: 35)
      ],
    );
  }
}
