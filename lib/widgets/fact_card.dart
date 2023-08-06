import 'dart:io';

import 'package:cat_trivia/l10n/l10n.dart';
import 'package:cat_trivia/models/fact_ui_model.dart';
import 'package:cat_trivia/services/theme/app_color_scheme.dart';
import 'package:cat_trivia/services/theme/app_text_style.dart';
import 'package:cat_trivia/utils/extensions.dart';
import 'package:cat_trivia/widgets/error_image.dart';
import 'package:flutter/material.dart';

class FactCard extends StatefulWidget {
  const FactCard({required this.model, this.margin, super.key});
  final FactUIModel? model;
  final EdgeInsets? margin;

  @override
  State<FactCard> createState() => _FactCardState();
}

class _FactCardState extends State<FactCard> {
  late final theme = Theme.of(context);
  late final colors = theme.extension<AppColorScheme>()!;
  late final styles = theme.extension<AppTextStyle>()!;
  late final l10n = context.l10n;

  late double screenHeight;
  late double imageWidth;

  @override
  void didChangeDependencies() {
    screenHeight = MediaQuery.of(context).size.height;
    imageWidth = MediaQuery.of(context).size.width -
        (widget.margin?.left ?? 0) -
        (widget.margin?.right ?? 0);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            child: Container(
              key: ValueKey(widget.model?.id ?? ''),
              height: imageWidth,
              width: imageWidth,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: widget.model?.imagePath ?? '',
                child: Image.file(
                  File(widget.model?.imagePath ?? ''),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return ErrorImage.normal();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (widget.model != null)
            Text(
              l10n.created(widget.model!.createdAt.toLocalFormat()),
              style: styles.bodySmall,
            ),
          const SizedBox(height: 16),
          Text(
            widget.model == null ? l10n.loading : widget.model!.text,
            style: styles.bodyRegular,
          ),
        ],
      ),
    );
  }
}
