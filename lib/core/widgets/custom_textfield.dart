import 'package:country_code_picker/country_code_picker.dart';
import 'package:elwatn/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.image,
      required this.title,
      required this.textInputType,
      this.minLine = 1,
      this.isPassword = false})
      : super(key: key);
  final String image;
  final String title;
  final int minLine;
  final bool isPassword;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Column(
        children: [
          image != "null"
              ? Row(
                  children: [
                    SvgPicture.asset(image),
                    const SizedBox(width: 6),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                )
              : const SizedBox(width: 0),
          image != "null"
              ? const SizedBox(height: 6)
              : const SizedBox(width: 0),
          TextFormField(
            keyboardType: textInputType,
            obscureText: isPassword,
            decoration: InputDecoration(
                prefixIcon: (title == "Phone" || title == "Whatsapp")
                    ? CountryCodePicker(
                        onChanged: (CountryCode countryCode) {},
                        initialSelection: 'IQ',
                        showFlag: false,
                        favorite: const ['+964', 'IQ'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        showDropDownButton: false,
                        enabled: false,
                        padding: EdgeInsets.zero,
                      )
                    : null,
                hintText: title,
                border: image != "null"
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                fillColor: AppColors.scaffoldBackground,
                filled: true),
            maxLines: isPassword ? 1 : 20,
            minLines: minLine,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
