import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../data/models/MyRooms.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  // late ServiceApi api;
  late List<MyMessage> list;
  late String imagePath;
  XFile? imageFile;
  String imageType = '';

  ChatCubit() : super(IsLoading()) {
    // api = ServiceApi();
    imagePath = "";
    // list = [];

    //  getChat();
  }

  // void getChat(String room_id) async {
  //   try {
  //     UserModel model = await Preferences.instance.getUserModel();
  //     String user_token = '';
  //     if (model.user.isLoggedIn) {
  //       user_token = model.access_token;
  //     }
  //     emit(IsLoading());
  //     MessageDataModel response = await api.getAllMessage(user_token, room_id);
  //     // print(response.status.code);
  //     // print(response.data.messages.length);
  //     if (response.status.code == 200) {
  //       list = response.data.messages;
  //       emit(OnDataSuccess(list));
  //     }
  //   } catch (e) {
  //     OnError(e.toString());
  //   }
  // }
  //
  pickImage(
      {required String type,
      required MyRoomsDatum myRoomsDatum,
      required BuildContext context}) async {
    imageFile = await ImagePicker().pickImage(
        source: type == 'camera' ? ImageSource.camera : ImageSource.gallery);
    imageType = 'file';

    imagePath = imageFile!.path;
    // sendimage(context, imagePath, chatModel);
    //emit(UserPhotoPicked(imagePath));
  }

  // sendimage(BuildContext context, String imagepath, ChatModel chatModel) async {
  //   try {
  //     //emit(OnDataSuccess(list));
  //     UserModel model = await Preferences.instance.getUserModel();
  //     String user_token = '';
  //     if (model.user.isLoggedIn) {
  //       user_token = model.access_token;
  //     }
  //     //   print(chatModel.provider.id);
  //
  //     SingleMessageDataModel response = await api.sendMessage(
  //         imagepath,
  //         "",
  //         "file",
  //         chatModel.id.toString(),
  //         chatModel.provider.id.toString(),
  //         user_token);
  //     print("sssss${response.status!.code}");
  //     if (response.status?.code == 200) {
  //       list.add(response.data!);
  //       //   list.add(new MessageModel());
  //       print(list.length);
  //       emit(OnDataSuccess(list));
  //     } else {
  //       //  Navigator.pop(context);
  //       print(response.status!.message);
  //       emit(OnError(response.status!.message));
  //     }
  //   } catch (e) {
  //     print('Errorsssss=>${e}');
  //     //Navigator.pop(context);
  //     emit(OnError(e.toString()));
  //   }
  // }
  //
  // sendmessage(BuildContext context, String message, ChatModel chatModel) async {
  //   try {
  //     UserModel model = await Preferences.instance.getUserModel();
  //     String user_token = '';
  //     if (model.user.isLoggedIn) {
  //       user_token = model.access_token;
  //     }
  //     //   print(chatModel.provider.id);
  //
  //     SingleMessageDataModel response = await api.sendMessage(
  //         "",
  //         message,
  //         "text",
  //         chatModel.id.toString(),
  //         chatModel.provider.id.toString(),
  //         user_token);
  //     print(response.status!.message);
  //     if (response.status?.code == 200) {
  //       print('Error=>${list.length}');
  //
  //       list.add(response.data!);
  //       // list.add(new MessageModel());
  //       print(list.length);
  //       emit(OnDataSuccess(list));
  //     } else {
  //       //  Navigator.pop(context);
  //       print(response.status!.message);
  //       emit(OnError(response.status!.message));
  //     }
  //   } catch (e) {
  //     print('Error=>${e}');
  //     //Navigator.pop(context);
  //     emit(OnError(e.toString()));
  //   }
  // }
  //
}
