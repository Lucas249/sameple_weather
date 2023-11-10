import 'package:flutter/material.dart';
import '../../base/base.dart';

import '../../gen/colors.gen.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final InputDecoration? inputDecoration;
  final String? hintText;
  final Widget? icon;
  final TextStyle? hintStyle;
  final int? maxLines;
  final bool? readOnly;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onEditingCompleted;
  final bool? autoFocus;
  final bool? isEmail;
  final bool? isPassword;
  final TextInputAction? textInputAction;

  const CustomTextField({
    Key? key,
    this.textEditingController,
    this.focusNode,
    this.inputDecoration,
    this.hintText,
    this.icon,
    this.hintStyle,
    this.maxLines,
    this.readOnly,
    this.onSubmitted,
    this.onChanged,
    this.onEditingCompleted,
    this.autoFocus,
    this.isEmail,
    this.isPassword,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  @override
  void initState() {
    _textEditingController = widget.textEditingController ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _textEditingController.addListener(() {
      _textEditingController.selection = TextSelection.collapsed(offset: _textEditingController.text.length);
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (value) {
        if (!value && _textEditingController.text.isNotNullOrEmpty && !_focusNode.hasFocus) {
          widget.onSubmitted?.call(_textEditingController.text);
        }
      },
      child: TextFormField(
        validator: (value) {
          if (value?.isNullOrEmpty ?? false) {
            return TextConstants.emptyValue;
          }
          return '';
        },
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        obscureText: widget.isPassword ?? false,
        readOnly: widget.readOnly ?? false,
        autofocus: false,
        cursorColor: ColorName.darkBlue,
        controller: _textEditingController,
        focusNode: _focusNode,
        maxLines: widget.maxLines ?? 1,
        onChanged: (value) {
          _textEditingController.selection = TextSelection.collapsed(offset: value.length);
          if (widget.isPassword ?? false) {
            widget.onSubmitted?.call(value);
          }
          widget.onChanged?.call(value);
        },
        onEditingComplete: () {
          if (_textEditingController.text.isNotNullOrEmpty) {
            widget.onEditingCompleted?.call(_textEditingController.text);
          }
        },
        onFieldSubmitted: (value) {
          _focusNode.nextFocus();
          widget.onSubmitted?.call(value);
        },
        decoration: widget.inputDecoration ??
            InputDecoration(
              hintText: widget.hintText ?? '',
              hintStyle: widget.hintStyle ??
                  const TextStyle(
                    color: ColorName.gray,
                    fontSize: NumberConstants.size16,
                  ),
              icon: widget.icon ?? const SizedBox(),
              border: InputBorder.none,
            ),
      ),
    );
  }
}
