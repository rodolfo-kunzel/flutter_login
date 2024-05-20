import 'package:flutter/material.dart';
import 'package:flutter_login/core/utils/constants/app_constansts.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  }) : super(key: key);

  factory CustomTextFormField.email({
    required TextEditingController controller,
    String? labelText,
  }) {
    return CustomTextFormField(
      controller: controller,
      labelText: labelText ?? kEmail,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return kEnterEmail;
        }
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
        if (!emailRegex.hasMatch(value)) {
          return kEnterValidEmail;
        }
        return null;
      },
    );
  }

  factory CustomTextFormField.password({
    required TextEditingController controller,
    String? labelText,
  }) {
    return CustomTextFormField(
      controller: controller,
      labelText: labelText ?? kPassword,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return kEnterPassword;
        }
        if (value.length < 6) {
          return kPasswordMinCaracters;
        }
        return null;
      },
    );
  }

  factory CustomTextFormField.normal({
    required TextEditingController controller,
    String? labelText,
  }) {
    return CustomTextFormField(
      controller: controller,
      labelText: labelText ?? 'Text',
    );
  }

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).focusColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(1)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kErrorColor, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kErrorColor, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        labelText: widget.labelText,
        suffixIcon: widget.obscureText
            ? IconButton(
                color: Theme.of(context).iconTheme.color,
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
                onPressed: _toggleObscureText,
              )
            : widget.suffixIcon,
      ),
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
    );
  }
}
