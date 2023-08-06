part of home_part;

@immutable
abstract class HomeState extends Equatable {
  const HomeState({required this.isBusy, this.model});

  final bool isBusy;
  final FactUIModel? model;
}

class InitialState extends HomeState {
  const InitialState({super.isBusy = false});

  @override
  List<Object?> get props => [isBusy, model];
}

class FactProcessingState extends HomeState {
  const FactProcessingState({required super.model, super.isBusy = false});

  @override
  List<Object?> get props => [isBusy, model];
}

class GoToHistoryState extends HomeState {
  const GoToHistoryState({required super.model, super.isBusy = false});

  @override
  List<Object?> get props => [Random().nextInt(256)];
}
