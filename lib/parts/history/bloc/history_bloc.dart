part of history_part;

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(super.initialState, this.repository) {
    on<GetHistoryEvent>(_getHistoryEventHandler, transformer: droppable());
    on<ClearHistoryEvent>(_clearHistoryEventHandler, transformer: droppable());
    on<GoToDetailsEvent>(_goToDetailsEventHandler, transformer: droppable());
  }

  IHistoryRepository repository;

  FutureOr<void> _getHistoryEventHandler(
    GetHistoryEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(HistoryModelsState(models: state.models, isBusy: true));
    final models = (await repository.getFacts())
        .map((db) => FactUIModel.fromDbModel(db))
        .toList();
    emit(HistoryModelsState(models: models));
  }

  FutureOr<void> _clearHistoryEventHandler(
    ClearHistoryEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(HistoryModelsState(models: state.models, isBusy: true));
    await repository.clearFacts();
    emit(const HistoryModelsState(models: []));
  }

  FutureOr<void> _goToDetailsEventHandler(
    GoToDetailsEvent event,
    Emitter<HistoryState> emit,
  ) {
    emit(GoToDetailsState(models: state.models, model: event.model));
  }
}
