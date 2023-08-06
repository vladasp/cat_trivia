import 'package:cat_trivia/models/fact_ui_model.dart';
import 'package:cat_trivia/parts/history/history_part.dart';
import 'package:cat_trivia/parts/home/home_part.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteHelper {
  static GoRouter routes({required String initialRoute}) => GoRouter(
        initialLocation: initialRoute,
        debugLogDiagnostics: true,
        navigatorKey: navigatorKey,
        routes: [
          GoRoute(
            path: HomePart.route,
            builder: (context, state) => const HomePart(),
          ),
          GoRoute(
            path: HistoryPart.route,
            builder: (context, state) => const HistoryPart(),
          ),
          GoRoute(
            path: FactDetails.route,
            builder: (context, state) => FactDetails(
              model: state.extra! as FactUIModel,
            ),
          ),
        ],
      );
}
