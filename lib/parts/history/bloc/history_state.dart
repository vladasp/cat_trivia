part of history_part;

@immutable
abstract class HistoryState extends Equatable {
  const HistoryState({required this.isBusy, required this.models});

  final bool isBusy;
  final List<FactUIModel> models;
}

class InitialState extends HistoryState {
  const InitialState({super.isBusy = false, super.models = const []});

  @override
  List<Object?> get props => [isBusy, models];
}

class HistoryModelsState extends HistoryState {
  const HistoryModelsState({required super.models, super.isBusy = false});
  @override
  List<Object?> get props => [isBusy, models];
}

class GoToDetailsState extends HistoryState {
  const GoToDetailsState(
      {required super.models, required this.model, super.isBusy = false});

  final FactUIModel model;
  @override
  List<Object?> get props => [Random().nextInt(256)];
}
