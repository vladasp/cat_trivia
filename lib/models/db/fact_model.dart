import 'package:cat_trivia/services/rest/rest_client.dart';
import 'package:hive/hive.dart';

part 'fact_model.g.dart';

@HiveType(typeId: 0)
class FactModel extends HiveObject {
  FactModel(
      {required this.id,
      required this.text,
      required this.imagePath,
      required this.createdAt});

  factory FactModel.fromResponse(
      {required String imagePath, required FactResponse response}) {
    return FactModel(
      imagePath: imagePath,
      id: response.id ?? '',
      text: response.text ?? '',
      createdAt: response.createdAt ?? '',
    );
  }

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final String createdAt;

  @HiveField(3)
  final String imagePath;
}
