// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactDataModelAdapter extends TypeAdapter<FactDataModel> {
  @override
  final int typeId = 1;

  @override
  FactDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactDataModel(
      id: fields[0] as String,
      createdAt: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FactDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
