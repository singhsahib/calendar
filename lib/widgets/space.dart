import 'package:calendar/constants/size.dart';
import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double? spaceX;
  final double? spaceY;

  const Space({
    this.spaceX,
    this.spaceY,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: spaceX != null ? CustomSize.getWidth(width, spaceX!) : null,
      height: spaceY != null ? CustomSize.getHeight(height, spaceY!) : null,
    );
  }
}
