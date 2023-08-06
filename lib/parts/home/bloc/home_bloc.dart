part of home_part;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState, this.repository) {
    on<NextFactEvent>(_nextFactEventHandler, transformer: droppable());
    on<GoToHistoryEvent>(_goToHistoryHandler);
  }

  IHomeRepository repository;

  FutureOr<void> _nextFactEventHandler(
    NextFactEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(FactProcessingState(model: state.model, isBusy: true));
    final newFact = await repository.getRandomFact();
    emit(FactProcessingState(
        model: newFact == null ? null : FactUIModel.fromDbModel(newFact)));
  }

  FutureOr<void> _goToHistoryHandler(
      GoToHistoryEvent event, Emitter<HomeState> emit) {
    emit(GoToHistoryState(model: state.model));
  }
}
