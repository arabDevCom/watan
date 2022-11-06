import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../../features/register/presentation/cubit/register_cubit.dart';
import '../utils/assets_manager.dart';
import 'network_image.dart';

class ProfilePhotoWidget extends StatefulWidget {
  const ProfilePhotoWidget({Key? key, required this.kind}) : super(key: key);
  final String kind;

  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  XFile? image;
  final picker = ImagePicker();

  Future getImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      if (widget.kind == "agent") {
        print("agent");
        print(widget.kind);
        context.read<ProfileCubit>().image = image;
      } else {
        print("user");
        print(widget.kind);
        context.read<RegisterCubit>().image = image;
      }
    }
    return Stack(
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: widget.kind == "agent"
                  ? context.read<ProfileCubit>().agentBtnText != "update"
                      ? (image != null)
                          ? Image.file(
                              File(image!.path),
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(ImageAssets.profileImage)
                      : (image != null)
                          ? Image.file(
                              File(image!.path),
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            )
                          : ManageNetworkImage(
                              imageUrl: widget.kind == "agent"
                                  ? context.read<ProfileCubit>().imageLink
                                  : context.read<RegisterCubit>().imageLink,
                              width: 140,
                              height: 140,
                              borderRadius: 140,
                            )
                  : context.read<RegisterCubit>().registerBtn != "update"
                      ? (image != null)
                          ? Image.file(
                              File(image!.path),
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(ImageAssets.profileImage)
                      : (image != null)
                          ? Image.file(
                              File(image!.path),
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            )
                          : ManageNetworkImage(
                              imageUrl: widget.kind == "agent"
                                  ? context.read<ProfileCubit>().imageLink
                                  : context.read<RegisterCubit>().imageLink,
                              width: 140,
                              height: 140,
                              borderRadius: 140,
                            ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: getImage,
            child: SvgPicture.asset(ImageAssets.editPhotoIcon),
          ),
        ),
      ],
    );
  }
}