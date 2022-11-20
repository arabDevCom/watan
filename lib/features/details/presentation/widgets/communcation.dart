import 'dart:convert';

import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/snackbar_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/call_method.dart';
import '../../../../core/utils/whatsapp_launch_method.dart';
import '../../../chat/domain/entities/open_room_model.dart';
import '../../../chat/presentation/screens/chat_page.dart';
import '../../../chat/presentation/screens/conversation_screen/cubit/conversation_page_cubit.dart';
import '../../../login/data/models/login_data_model.dart';
import '../../../login/presentation/screens/login.dart';

class CommunicationWidget extends StatefulWidget {
  const CommunicationWidget({
    Key? key,
    required this.phone,
    required this.whatsapp,
    required this.type,
    required this.userId,
    required this.postId,
  }) : super(key: key);
  final String phone;
  final String whatsapp;
  final String type;
  final int userId;
  final int postId;

  @override
  State<CommunicationWidget> createState() => _CommunicationWidgetState();
}

class _CommunicationWidgetState extends State<CommunicationWidget> {
  LoginDataModel? loginDataModel;

  _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      LoginDataModel loginDataModel = LoginDataModel.fromJson(userMap);
      this.loginDataModel = loginDataModel;
      if (this.loginDataModel != null) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getStoreUser();
  }

  @override
  Widget build(BuildContext context) {
    createRoom() async {
      await context
          .read<ConversationPageCubit>()
          .createRoom(
            OpenRoom(
              type: widget.type,
              toUserId: widget.userId,
              projectId: widget.postId,
              postId: widget.postId,
              token: loginDataModel!.data!.accessToken,
            ),
          )
          .then((value) {
        if (value.code != 200) {
          snackBar("Can't Open Chat With This User", context,
              color: AppColors.error);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ChatPage(myRoomDatum: value.createRoom!);
              },
            ),
          );
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      child: Row(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: () {
              phoneCallMethod(widget.phone);
            },
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.callButtonBackground,
                  borderRadius: BorderRadius.circular(25)),
              child: SvgPicture.asset(
                ImageAssets.callIcon,
                height: 8,
                width: 8,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              launchWhatsApp(
                widget.whatsapp,
              );
            },
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.whatsappButtonBackground,
                  borderRadius: BorderRadius.circular(25)),
              child: SvgPicture.asset(
                ImageAssets.whatsappIcon,
                height: 8,
                width: 8,
              ),
            ),
          ),
          const Spacer(),
          if (loginDataModel != null) ...{
            widget.type != 'agent'
                ? widget.userId != loginDataModel!.data!.user!.id
                    ? GestureDetector(
                        onTap: () {
                          loginDataModel == null
                              ? Alert(
                                  context: context,
                                  type: AlertType.warning,
                                  title: "\n You Should Login First ",
                                  buttons: [
                                    DialogButton(
                                      onPressed: () => Navigator.pop(context),
                                      color: AppColors.buttonBackground,
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    DialogButton(
                                      onPressed: () =>
                                          Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const LoginScreen();
                                          },
                                        ),
                                      ),
                                      color: AppColors.error,
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    )
                                  ],
                                ).show()
                              : createRoom();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(25)),
                          child: SvgPicture.asset(
                            ImageAssets.chatIcon,
                            height: 8,
                            width: 8,
                          ),
                        ),
                      )
                    : const SizedBox()
                : const SizedBox(),
            widget.type != 'agent'
                ? widget.userId != loginDataModel!.data!.user!.id
                    ? const Spacer()
                    : const SizedBox()
                : const SizedBox(),
          }
        ],
      ),
    );
  }
}
