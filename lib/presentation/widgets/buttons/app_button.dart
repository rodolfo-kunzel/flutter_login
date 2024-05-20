import 'package:flutter/material.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';

class AppButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final double maxHeight;
  final double minHeight;
  final bool isOutlined;
  final bool isLoading;

  const AppButton._({
    required this.onTap,
    required this.text,
    this.maxHeight = 54,
    this.minHeight = 32,
    this.isOutlined = false,
    this.isLoading = false,
  });

  factory AppButton.filled({
    required void Function() onTap,
    required String text,
    double maxHeight = 54,
    double minHeight = 32,
    Color? backgroundColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      onTap: onTap,
      text: text,
      maxHeight: maxHeight,
      minHeight: minHeight,
      isLoading: isLoading,
    );
  }

  factory AppButton.outlined({
    required void Function() onTap,
    required String text,
    double maxHeight = 54,
    double minHeight = 32,
    Color? borderColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      onTap: onTap,
      text: text,
      maxHeight: maxHeight,
      minHeight: minHeight,
      isOutlined: true,
      isLoading: isLoading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        constraints: BoxConstraints(maxHeight: maxHeight, minHeight: minHeight),
        decoration: BoxDecoration(
          color: isOutlined
              ? kLightScaffoldBackgroundColor
              : Theme.of(context).primaryColor,
          border: isOutlined
              ? Border.all(color: Theme.of(context).primaryColor, width: 2)
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isOutlined
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
              : Text(text,
                  style: isOutlined
                      ? Theme.of(context).textTheme.headlineSmall
                      : Theme.of(context).textTheme.headlineMedium),
        ),
      ),
    );
  }
}
