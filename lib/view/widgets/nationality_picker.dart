import 'package:bounce/bounce.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class CountryPickerButton extends StatelessWidget {
  final RxString selectedFlag;

  const CountryPickerButton({super.key, required this.selectedFlag});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Bounce(
        onTap: () {
          showCountryPicker(
            context: context,
            countryListTheme: CountryListThemeData(
              padding: EdgeInsets.all(0),
              bottomSheetHeight: 500,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              searchTextStyle: TextStyle(fontSize: 12, color: kTertiaryColor),
              inputDecoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                fillColor: kInputBgColor,
                filled: true,
                hintText: "search".tr,
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: kTertiaryColor.withOpacity(0.4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kBorderColor, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kBorderColor, width: 1),
                ),
              ),
            ),
            onSelect: (Country country) {
              selectedFlag.value = country.flagEmoji;
            },
          );
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: rounded2r(ktransparent, kBorderColor, 100),
          child: Row(
            children: [
              Expanded(
                child: MyText(
                  text: '${selectedFlag}',
                  color: kTertiaryColor,
                  size: 20,
                  paddingRight: 3,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: kQuaternaryColor,
              ),
              SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }
}
