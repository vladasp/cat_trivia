import 'package:cat_trivia/services/theme/app_color_scheme.dart';
import 'package:cat_trivia/utils/resources.dart';
import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage._private({
    required this.imageSize,
    super.key,
  });

  factory ErrorImage.normal({Key? key}) {
    return ErrorImage._private(imageSize: 156, key: key);
  }

  factory ErrorImage.small({Key? key}) {
    return ErrorImage._private(imageSize: 24, key: key);
  }

  final double imageSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorScheme>()!;

    return Container(
      color: colors.accentColor,
      child: Center(
        child: Image.asset(
          Resources.brokenPhoto,
          height: imageSize,
          color: colors.tertiaryColor,
        ),
      ),
    );
  }
}
