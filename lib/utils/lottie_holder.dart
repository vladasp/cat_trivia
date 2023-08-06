import 'package:lottie/lottie.dart';

class LottieHolder {
  LottieHolder._private();
  static final LottieHolder _singleton = LottieHolder._private();
  static LottieHolder get I => _singleton;

  late LottieComposition composition;
  Future<void> init() async {
    composition = await AssetLottie('assets/cat.json').load();
  }
}
