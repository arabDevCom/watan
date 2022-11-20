
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/snackbar_method.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../cubit/report_post_cubit.dart';
import '../widgets/report_body_widget.dart';

class ReportPostScreen extends StatefulWidget {
  const ReportPostScreen({Key? key, required this.postType, required this.id}) : super(key: key);
  final String postType;
  final String id;
  @override
  State<ReportPostScreen> createState() => _ReportPostScreenState();
}

class _ReportPostScreenState extends State<ReportPostScreen> {
  final formKey = GlobalKey<FormState>();
  late ReportPostCubit reportPostCubit;

  @override
  void dispose() {
    super.dispose();
    reportPostCubit.projectId = "";
    reportPostCubit.userId = "";
    reportPostCubit.image = null;
    reportPostCubit.detailsController.clear();
    reportPostCubit.reasonController.clear();
  }

  @override
  Widget build(BuildContext context) {
    reportPostCubit = context.read<ReportPostCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          translateText(AppStrings.reportPostText, context),
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: BlocBuilder<ReportPostCubit, ReportPostState>(
  builder: (context, state) {
    if(state is ReportPostLoaded){
      Future.delayed(
        const Duration(milliseconds: 400),
            () {
          Navigator.of(context).pop();

        },
      );
      return const ShowLoadingIndicator();
    }
    if(state is ReportPostLoading){
      return const ShowLoadingIndicator();
    }else if(state is ReportPostError){
      Future.delayed(const Duration(milliseconds: 400), () {
        snackBar(
          translateText(AppStrings.errorMessage, context),
          context,
          color: AppColors.error,
        );
      });
      return ReportBodyWidget(id: widget.id,postType: widget.postType,);
    }else{
      return ReportBodyWidget(id: widget.id,postType: widget.postType,);
    }
  },
),
    );
  }
}
