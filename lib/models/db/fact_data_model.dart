import 'package:cat_trivia/services/rest/rest_client.dart';
import 'package:hive/hive.dart';

part 'fact_data_model.g.dart';

@HiveType(typeId: 1)
class FactDataModel extends HiveObject {
  FactDataModel({
    required this.id,
    required this.createdAt,
  });

  factory FactDataModel.fromResponse(
      {required String imagePath, required FactResponse response}) {
    return FactDataModel(
      id: response.id ?? '',
      createdAt: response.createdAt ?? '',
    );
  }

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String createdAt;
}
