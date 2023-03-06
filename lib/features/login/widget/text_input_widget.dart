import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared_components/util/cusmtom_colors.dart';

class TextInputWidget extends StatefulWidget {
  final String? hint;
  final bool? obscure;
  final TextEditingController? controller;
  final String suffixIcon;
  final String prefixIcon;

  const TextInputWidget(
      {Key? key,
      this.obscure = false,
      this.hint,
      this.controller,
      this.suffixIcon = "",
      required this.prefixIcon})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextInputWidgetState();
  }
}

class _TextInputWidgetState extends State<TextInputWidget> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: tertiaryColorLighter,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasError ? secondaryColor : primaryColor,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscure!,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint!,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
            ),
            suffixIcon: widget.suffixIcon.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.all(10),
                    width: 10,
                    height: 10,
                    child: SvgPicture.asset(
                      widget.suffixIcon,
                    ))
                : null,
            prefixIcon: Container(
                margin: const EdgeInsets.all(8),
                width: 10,
                height: 10,
                child: SvgPicture.asset(
                  widget.prefixIcon,
                ))),
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
        validator: (value) {
          setState(() {
            hasError = false;
          });

          if (value == null || value.isEmpty) {
            setState(() {
              hasError = true;
            });
            return null;
          }

          return null;
        },
      ),
    );
  }
}
