// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingResponseAdapter extends TypeAdapter<SettingResponse> {
  @override
  final int typeId = 2;

  @override
  SettingResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingResponse(
      currencySymbol: fields[0] as String?,
      fYEndDate: fields[1] as String?,
      fYStartDate: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SettingResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.currencySymbol)
      ..writeByte(1)
      ..write(obj.fYEndDate)
      ..writeByte(2)
      ..write(obj.fYStartDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SettingResponseAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
