import 'package:cat_trivia/services/theme/app_color_scheme.dart';
import 'package:cat_trivia/services/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({required this.title, super.key, this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late final theme = Theme.of(context);
  late final colors = theme.extension<AppColorScheme>()!;
  late final styles = theme.extension<AppTextStyle>()!;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colors.primaryColor),
          textStyle: MaterialStateProperty.all(styles.buttonRegular),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(widget.title),
      ),
    );
  }
}
