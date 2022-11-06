import 'package:elwatn/core/widgets/scound_main_project_item.dart';
import 'package:elwatn/core/widgets/error_widget.dart' as error_widget;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../../../home_page/data/models/main_project_item_data_model.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';
import '../cubit/project_details_cubit.dart';

class AllUserProjectsScreen extends StatefulWidget {
  const AllUserProjectsScreen({Key? key, required this.mainProjectItemModel})
      : super(key: key);
  final MainProjectItem mainProjectItemModel;

  @override
  State<AllUserProjectsScreen> createState() => _AllUserProjectsScreenState();
}

class _AllUserProjectsScreenState extends State<AllUserProjectsScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProjectDetailsCubit>()
        .allProjectPosts(widget.mainProjectItemModel.user.id.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "${widget.mainProjectItemModel.user.name} Projects",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: BlocBuilder<ProjectDetailsCubit, ProjectDetailsState>(
        builder: (context, state) {
          if (state is ProjectAllUserPostsLoading) {
            return const ShowLoadingIndicator();
          } else if (state is ProjectAllUserPostsLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    state.allPostsProject.data!.length,
                        (index) => SecondMainProjectItemWidget(
                      mainProjectItemModel: state.allPostsProject.data![index],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return error_widget.ErrorWidget(
              onPressed: () => context
                  .read<ProjectDetailsCubit>()
                  .allProjectPosts(widget.mainProjectItemModel.user.id.toString()),
            );
          }
        },
      ),
    );
  }
}
