// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaryDataAdapter extends TypeAdapter<DiaryData> {
  @override
  final int typeId = 0;

  @override
  DiaryData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiaryData(
      title: fields[0] as String?,
      comment: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DiaryData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiaryDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
