library home_part;

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cat_trivia/l10n/l10n.dart';
import 'package:cat_trivia/models/db/fact_model.dart';
import 'package:cat_trivia/models/fact_ui_model.dart';
import 'package:cat_trivia/parts/history/history_part.dart';
import 'package:cat_trivia/services/rest/rest_client.dart';
import 'package:cat_trivia/services/theme/app_color_scheme.dart';
import 'package:cat_trivia/services/theme/app_text_style.dart';
import 'package:cat_trivia/utils/constants.dart';
import 'package:cat_trivia/widgets/button.dart';
import 'package:cat_trivia/widgets/fact_card.dart';
import 'package:cat_trivia/widgets/overlays/loader.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

part 'home_screen.dart';
part 'bloc/home_bloc.dart';
part 'bloc/home_state.dart';
part 'bloc/home_event.dart';
part 'repository/home_repository.dart';

class HomePart extends StatelessWidget {
  const HomePart({super.key});
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(
          const InitialState(), HomeRepository(GetIt.I.get<RestClient>()))
        ..add(NextFactEvent()),
      child: const HomeScreen(),
    );
  }
}
