import 'dart:io';

import 'package:cat_trivia/l10n/l10n.dart';
import 'package:cat_trivia/models/fact_ui_model.dart';
import 'package:cat_trivia/services/theme/app_color_scheme.dart';
import 'package:cat_trivia/services/theme/app_text_style.dart';
import 'package:cat_trivia/utils/extensions.dart';
import 'package:cat_trivia/widgets/error_image.dart';
import 'package:flutter/material.dart';

class FactListItem extends StatefulWidget {
  const FactListItem({required this.model, super.key, this.onPressed});
  final FactUIModel model;
  final VoidCallback? onPressed;

  @override
  State<FactListItem> createState() => _FactListItemState();
}

class _FactListItemState extends State<FactListItem> {
  late final theme = Theme.of(context);
  late final colors = theme.extension<AppColorScheme>()!;
  late final styles = theme.extension<AppTextStyle>()!;
  late final l10n = context.l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: colors.tertiaryColor!.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: const Offset(0, 1),
            )
          ]),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          radius: 8,
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: styles.labelRegular,
                      ),
                      Text(
                        l10n.created(widget.model.createdAt.toLocalFormat()),
                        style: styles.labelSmall,
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: widget.model.imagePath,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(24)),
                    child: Image.file(
                      File(widget.model.imagePath),
                      fit: BoxFit.cover,
                      height: 48,
                      width: 48,
                      errorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                            height: 48, width: 48, child: ErrorImage.small());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
