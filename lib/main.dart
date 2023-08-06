import 'dart:developer';
import 'dart:io';

import 'package:cat_trivia/models/db/fact_model.dart';
import 'package:cat_trivia/parts/home/home_part.dart';
import 'package:cat_trivia/services/rest/rest_client.dart';
import 'package:cat_trivia/utils/bloc_observable.dart';
import 'package:cat_trivia/utils/constants.dart';
import 'package:cat_trivia/utils/lottie_holder.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();
  final appDirectory = await getApplicationDocumentsDirectory();

  final dbDirectory =
      await Directory('${appDirectory.path}/db').create(recursive: true);

  Hive
    ..init(dbDirectory.path)
    ..registerAdapter(FactModelAdapter());
  await Hive.openBox<FactModel>(Constants.factsBox);

  final dio = Dio();
  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient()
      ..idleTimeout = const Duration(seconds: 3)
      ..badCertificateCallback = (cert, host, port) => true;
    return client;
  };
  final rest = RestClient(dio);
  GetIt.I.registerSingleton<RestClient>(rest);
  await LottieHolder.I.init();

  runApp(App(initialRoute: HomePart.route));
}
