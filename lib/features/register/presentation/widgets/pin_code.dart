import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utils/app_colors.dart';

class PicCodeWidget extends StatefulWidget {
  const PicCodeWidget({Key? key, this.formKey}) : super(key: key);
  final formKey;

  @override
  State<PicCodeWidget> createState() => _PicCodeWidgetState();
}

class _PicCodeWidgetState extends State<PicCodeWidget> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";
  StreamController<ErrorAnimationType>? errorController;

  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
        child: PinCodeTextField(
          appContext: context,
          length: 4,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 3) {
              return "I'm from validator";
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            inactiveColor: AppColors.gray,
            activeColor: AppColors.gray,
            shape: PinCodeFieldShape.underline,
            selectedColor: AppColors.primary,),
          cursorColor: AppColors.primary,
          animationDuration: const Duration(milliseconds: 300),
          errorAnimationController: errorController,
          controller: textEditingController,
          keyboardType: TextInputType.number,
          onCompleted: (v) {
            debugPrint("Completed");
          },
          onChanged: (value) {
            debugPrint(value);
            setState(() {
              currentText = value;
            });
          },
        ),
      ),
    );
  }
}
