library history_part;

import 'dart:async';
import 'dart:developer' as d;
import 'dart:io';
import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cat_trivia/l10n/l10n.dart';
import 'package:cat_trivia/models/db/fact_model.dart';
import 'package:cat_trivia/models/fact_ui_model.dart';
import 'package:cat_trivia/services/theme/app_color_scheme.dart';
import 'package:cat_trivia/services/theme/app_text_style.dart';
import 'package:cat_trivia/utils/constants.dart';
import 'package:cat_trivia/widgets/fact_card.dart';
import 'package:cat_trivia/widgets/fact_list_item.dart';
import 'package:cat_trivia/widgets/overlays/loader.dart';
import 'package:cat_trivia/widgets/popups/popup.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

part 'screens/history_screen.dart';
part 'screens/fact_details.dart';
part 'bloc/history_bloc.dart';
part 'bloc/history_state.dart';
part 'bloc/history_event.dart';
part 'repository/history_repository.dart';

class HistoryPart extends StatelessWidget {
  const HistoryPart({super.key});
  static const route = '/history';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryBloc(const InitialState(), HistoryRepository())
        ..add(GetHistoryEvent()),
      child: const HistoryScreen(),
    );
  }
}
