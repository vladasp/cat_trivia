part of history_part;

abstract class IHistoryRepository {
  Future<List<FactModel>> getFacts();
  Future<void> clearFacts();
}

class HistoryRepository implements IHistoryRepository {
  @override
  Future<List<FactModel>> getFacts() async {
    final models =
        Hive.box<FactModel>(Constants.factsBox).values.toList().reversed;
    return models.toList();
  }

  @override
  Future<void> clearFacts() async {
    final models = Hive.box<FactModel>(Constants.factsBox).values;
    for (var model in models) {
      try {
        await File(model.imagePath).delete();
      } catch (ex) {
        d.log(ex.toString());
      }
    }
    await Hive.box<FactModel>(Constants.factsBox).clear();
  }
}
