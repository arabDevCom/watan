import 'package:elwatn/core/utils/snackbar_method.dart';
import 'package:elwatn/features/favorite/presentation/cubit/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class FavouriteIcon extends StatelessWidget {
  FavouriteIcon({Key? key, required this.isFavourite, required this.id, required this.modelKind}) : super(key: key);

  bool isFavourite;
  final String id;
  final String modelKind;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (context.read<FavouritesCubit>().message ==
            'Success add to favorite') {
          isFavourite = true;
        }
        if (context.read<FavouritesCubit>().message ==
            'Success remove from favorite') {
          isFavourite = false;
        }
        return GestureDetector(
          onTap: () {
            print(isFavourite);
            context.read<FavouritesCubit>().changeFavouritesStatus(id, modelKind);
          },
          child: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            color: isFavourite ? AppColors.primary : AppColors.black,
          ),
        );
      },
    );
  }
}
