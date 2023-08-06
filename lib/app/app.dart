import 'package:cat_trivia/l10n/l10n.dart';
import 'package:cat_trivia/router/router.dart';
import 'package:cat_trivia/services/theme/theme_service.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({super.key, required this.initialRoute});
  final String initialRoute;
  late final _router = RouteHelper.routes(initialRoute: initialRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeService.light().theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}
