import 'package:cat_trivia/services/theme/app_color_scheme.dart';
import 'package:cat_trivia/utils/lottie_holder.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderOverlay {
  static OverlayEntry build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return OverlayEntry(
      builder: (builder) {
        return ColoredBox(
          color: Colors.transparent,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: colors.backgroundColor!.withOpacity(0.8),
                  ),
                ),
                Lottie(composition: LottieHolder.I.composition, height: 100),
              ],
            ),
          ),
        );
      },
    );
  }
}
