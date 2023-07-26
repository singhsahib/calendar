import 'package:calendar/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

class EventColorScreen extends StatelessWidget {
  Color color;
  final void Function(Color color) onColorChange;

  EventColorScreen({
    required this.color,
    required this.onColorChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AlertDialog(
      // contentPadding: EdgeInsets.zero,
      // insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          CustomSize.size(width, height, 20),
        ),
      ),
      title: Text(
        "Pick a Color for the Event",
        style: TextStyle(
          fontSize: CustomSize.size(
            width,
            height,
            16,
          ),
        ),
      ),
      content: Container(
        height: height * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColorPicker(
              pickerColor: color,
              onColorChanged: onColorChange,
              // colorPickerWidth: width * 0.8,
              pickerAreaHeightPercent: 0.5,
              displayThumbColor: true,
            ),
            Space(spaceY: 10),
            Text(
              "Select from Default Colors",
              style: TextStyle(
                fontSize: CustomSize.size(width, height, 14),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                onColorChange(CustomColors.gradient_color2);
              },
              style: TextButton.styleFrom(
                primary: CustomColors.gradient_color2,
              ),
              icon: Container(
                width: CustomSize.getWidth(width, 20),
                height: CustomSize.getWidth(width, 20),
                decoration: BoxDecoration(
                  color: CustomColors.gradient_color2,
                  shape: BoxShape.circle,
                ),
              ),
              label: Text(
                "MAIN COLOR",
                style: TextStyle(
                  fontSize: CustomSize.size(
                    width,
                    height,
                    14,
                  ),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                onColorChange(CustomColors.primary_dark);
              },
              style: TextButton.styleFrom(
                primary: CustomColors.primary_dark,
              ),
              icon: Container(
                width: CustomSize.getWidth(width, 20),
                height: CustomSize.getWidth(width, 20),
                decoration: BoxDecoration(
                  color: CustomColors.primary_dark,
                  shape: BoxShape.circle,
                ),
              ),
              label: Text(
                "PRIMARY DARK",
                style: TextStyle(
                  fontSize: CustomSize.size(
                    width,
                    height,
                    14,
                  ),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                onColorChange(CustomColors.third_dark);
              },
              style: TextButton.styleFrom(
                primary: CustomColors.third_dark,
              ),
              icon: Container(
                width: CustomSize.getWidth(width, 20),
                height: CustomSize.getWidth(width, 20),
                decoration: BoxDecoration(
                  color: CustomColors.third_dark,
                  shape: BoxShape.circle,
                ),
              ),
              label: Text(
                "THIRD DARK",
                style: TextStyle(
                  fontSize: CustomSize.size(
                    width,
                    height,
                    14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: CustomColors.gradient_color2,
          ),
          child: Text(
            "DONE",
            style: TextStyle(
              fontSize: CustomSize.size(
                width,
                height,
                14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
