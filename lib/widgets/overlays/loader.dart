import 'dart:async';

import 'package:cat_trivia/widgets/overlays/loading_overlay.dart';
import 'package:flutter/material.dart';

OverlayEntry? _loader;
OverlayEntry? _toastOverlay;

Timer? _timer;
Timer? _toastTimer;

Future<void> loading(BuildContext context, {required bool visibility}) async {
  if (visibility) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 30), () {
      loading(context, visibility: false);
    });
    if (_loader == null) {
      _loader ??= LoaderOverlay.build(context);
      Overlay.of(context).insert(_loader!);
    }
  } else {
    _timer?.cancel();
    _loader?.remove();
    _loader = null;
  }
}

void dismiss() {
  _toastTimer?.cancel();
  _toastOverlay?.remove();
  _toastOverlay = null;
}
