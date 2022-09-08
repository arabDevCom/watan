import 'package:elwatn/features/home_page/domain/entities/slider_domain_model.dart';
import 'package:elwatn/features/home_page/presentation/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/banner_ads.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../../domain/entities/categories_domain_model.dart';
import '../cubit/home_page_cubit.dart';
import '../widgets/home_model.dart';
import 'package:elwatn/core/widgets/error_widget.dart'
as error_widget;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<HomePageCubit>().getAllMethodsOfData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit,HomePageState>(
      builder: (BuildContext context, state) {

        HomeSlider slider;
        Categories categories;

        if(state is HomePageLoading){
          return const ShowLoadingIndicator();
        }else if(state is HomePageLoaded){
          slider=state.slider;
          if(state is CategoriesLoaded){
            // categories=state.
          }
          return Column(
            children:  [
              BannerWidget(sliderData: []),
              const CategoriesWidget(),
              const HomeModelWidget(kind: "add New"),
              const HomeModelWidget(kind: "popular"),
            ],
          );
        } else{
          return error_widget.ErrorWidget(
            onPressed: () => context.read<HomePageCubit>().getAllMethodsOfData(),
          );
        }
      },
    );
  }


}
