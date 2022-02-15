// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveEntityAdapter extends TypeAdapter<HiveEntity> {
  @override
  final int typeId = 0;

  @override
  HiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveEntity(
      title: fields[0] as String,
      price: fields[1] as String,
      id: fields[2] as String,
      image: fields[3] as String,
      quantity: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
