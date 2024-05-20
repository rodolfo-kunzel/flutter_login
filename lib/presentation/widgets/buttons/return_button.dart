// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';
import 'package:flutter_svg/svg.dart';

class ReturnButton extends StatelessWidget {
  final Color color;
  final double size;

  const ReturnButton({
    Key? key,
    this.color = Colors.black,
    this.size = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SvgPicture.asset(
          kBackIcon,
          width: size,
          height: size,
          color: Theme.of(context).iconTheme.color!,
        ),
      ),
    );
  }
}
