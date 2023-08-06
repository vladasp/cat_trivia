part of history_part;

@immutable
abstract class HistoryEvent {}

class GetHistoryEvent extends HistoryEvent {}

class ClearHistoryEvent extends HistoryEvent {}

class GoToDetailsEvent extends HistoryEvent {
  GoToDetailsEvent(this.model);

  final FactUIModel model;
}
