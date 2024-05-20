import 'package:flutter/material.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final void Function()? onPop;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.message,
    this.onPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            onPop ?? Navigator.of(context).pop();
          },
          child: Text(
            kOk,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ],
    );
  }

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    void Function()? onPop,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => CustomDialog(
        title: title,
        message: message,
      ),
    );
  }
}
