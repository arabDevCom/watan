import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/convert_numbers_method.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:elwatn/features/details/presentation/screens/detales%20photo.dart';
import 'package:elwatn/features/details/presentation/widgets/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/toast_message_method.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../favorite/presentation/cubit/favourites_cubit.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';
import '../../../language/presentation/cubit/locale_cubit.dart';
import '../../../login/presentation/screens/login.dart';
import 'details_images_banner_widget.dart';

class HeaderWidget extends StatefulWidget {
   HeaderWidget({Key? key, required this.mainItem}) : super(key: key);
  final MainItem mainItem;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool isFavourite = false;

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isFavourite = widget.mainItem.isFavourite!;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailsBannerWidget(isDotes: false, imagesBanner: widget.mainItem.images!),
        Positioned(
          top: 8,
          left: 0,
          right: 0,
          child: Row(
            children: [
              //ToDo Icons Actions of share
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: IconShapeWidget(
                    text: "null",
                    icon: Icons.arrow_back_sharp,
                    onClick: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Expanded(
                  child: IconShapeWidget(
                      text: "null", icon: Icons.share, onClick: () {})),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.opacityWhite),
                    child: isLoading
                        ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                        : GestureDetector(
                      onTap: () {

                        if (context
                            .read<LocaleCubit>()
                            .loginDataModel ==
                            null) {
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title:
                            "\n ${translateText(AppStrings.shouldLoginText,context)} ",
                            buttons: [
                              DialogButton(
                                onPressed: () =>
                                    Navigator.pop(context),
                                color: AppColors
                                    .buttonBackground,
                                child:  Text(
                                  translateText(AppStrings.cancelBtn,context),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              ),
                              DialogButton(
                                onPressed: () =>
                                    Navigator.of(context)
                                        .push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const LoginScreen();
                                        },
                                      ),
                                    ),
                                color: AppColors.error,
                                child:  Text(
                                  translateText(AppStrings.loginText,context),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              )
                            ],
                          ).show();
                        }else{
                          context
                              .read<FavouritesCubit>()
                              .cubitKind = 'null';
                          context
                              .read<FavouritesCubit>()
                              .getFavourite = 'change';
                          setState(() {
                            isLoading = true;
                          });
                          context
                              .read<FavouritesCubit>()
                              .changeFavouritesStatus(
                            widget.mainItem.id
                                .toString(),
                            'ads',
                          )
                              .whenComplete(
                                () => Future.delayed(
                              Duration(
                                milliseconds: 500,
                              ),
                                  () {
                                setState(() {
                                  isLoading = false;
                                  if (context.read<FavouritesCubit>().message != 'There are some Errors') {
                                    isFavourite = context
                                        .read<
                                        FavouritesCubit>()
                                        .favourite;
                                  }
                                });
                                toastMessage(context.read<FavouritesCubit>().message, context, color: AppColors.primary,);
                              },
                            ),
                          );
                        }

                      },
                      child: Icon(
                        isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavourite
                            ? AppColors.primary
                            : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 8,
          left: 20,
          right: 20,
          child: Row(
            children: [
              widget.mainItem.images!.isNotEmpty
                  ? const Spacer()
                  : const SizedBox(width: 0),
              widget.mainItem.images!.isNotEmpty
                  ? IconShapeWidget(
                      text: IsLanguage.isEnLanguage(context)
                          ? widget.mainItem.images!.length.toString()
                          : replaceToArabicNumber(
                              widget.mainItem.images!.length.toString()),
                      icon: Icons.image,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPhotoScreen(
                                initialPage: 0,
                                mainItem: widget.mainItem,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              widget.mainItem.videos!.isNotEmpty
                  ? const Spacer()
                  : const SizedBox(width: 0),
              widget.mainItem.videos!.isNotEmpty
                  ? IconShapeWidget(
                      text: IsLanguage.isEnLanguage(context)
                          ? widget.mainItem.videos!.length.toString()
                          : replaceToArabicNumber(
                              widget.mainItem.videos!.length.toString()),
                      icon: Icons.video_camera_back,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPhotoScreen(
                                initialPage: 1,
                                mainItem: widget.mainItem,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              widget.mainItem.floorPlans!.isNotEmpty
                  ? const Spacer()
                  : const SizedBox(width: 0),
              widget.mainItem.floorPlans!.isNotEmpty
                  ? IconShapeWidget(
                      text: IsLanguage.isEnLanguage(context)
                          ? widget.mainItem.floorPlans!.length.toString()
                          : replaceToArabicNumber(
                              widget.mainItem.floorPlans!.length.toString()),
                      icon: Icons.schema_outlined,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPhotoScreen(
                                initialPage: 2,
                                mainItem: widget.mainItem,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
