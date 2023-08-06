part of home_part;

abstract class IHomeRepository {
  Future<FactModel?> getRandomFact();
  Future<void> saveFact(FactModel fact);
}

class HomeRepository implements IHomeRepository {
  late String documentDirectory;
  HomeRepository(this.client) {
    getApplicationDocumentsDirectory()
        .then((value) => documentDirectory = value.path);
  }
  final RestClient client;

  @override
  Future<FactModel?> getRandomFact() async {
    final result = await client.getFact();

    if (result != null) {
      final imageBiteList = await client.getImage();
      if (imageBiteList != null) {
        final imagePath = '$documentDirectory/${result.id}.jpg';
        await File(imagePath).writeAsBytes(imageBiteList);

        final uiModel =
            FactModel.fromResponse(imagePath: imagePath, response: result);
        saveFact(uiModel);
        return uiModel;
      }
    }
    return null;
  }

  @override
  Future<void> saveFact(FactModel fact) async {
    Hive.box<FactModel>(Constants.factsBox).add(fact);
  }
}
