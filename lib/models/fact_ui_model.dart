import 'package:cat_trivia/models/db/fact_model.dart';
import 'package:equatable/equatable.dart';

class FactUIModel extends Equatable {
  const FactUIModel({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.imagePath,
  });

  factory FactUIModel.fromDbModel(FactModel model) {
    return FactUIModel(
      id: model.id,
      text: model.text,
      createdAt: model.createdAt,
      imagePath: model.imagePath,
    );
  }

  final String id;
  final String text;
  final String createdAt;
  final String imagePath;

  @override
  List<Object?> get props => [id, text, createdAt, imagePath];
}
