part of home_part;

@immutable
abstract class HomeEvent {}

class NextFactEvent extends HomeEvent {}

class GoToHistoryEvent extends HomeEvent {}
