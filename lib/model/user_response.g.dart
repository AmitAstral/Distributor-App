// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserResponseAdapter extends TypeAdapter<UserResponse> {
  @override
  final int typeId = 1;

  @override
  UserResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserResponse(
      distributorUserID: fields[0] as String?,
      distributorSapCode: fields[1] as String?,
      distributorName: fields[2] as String?,
      distributorMobileNumber: fields[3] as String?,
      otp: fields[4] as String?,
      token: fields[5] as String?,
      allowAppVersion: fields[6] as String?,
      currentAppVersion: fields[7] as String?,
      isActive: fields[8] as String?,
      isPinSet: fields[9] as bool?,
      profile: fields[10] as String?,
      Address: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserResponse obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.distributorUserID)
      ..writeByte(1)
      ..write(obj.distributorSapCode)
      ..writeByte(2)
      ..write(obj.distributorName)
      ..writeByte(3)
      ..write(obj.distributorMobileNumber)
      ..writeByte(4)
      ..write(obj.otp)
      ..writeByte(5)
      ..write(obj.token)
      ..writeByte(6)
      ..write(obj.allowAppVersion)
      ..writeByte(7)
      ..write(obj.currentAppVersion)
      ..writeByte(8)
      ..write(obj.isActive)
      ..writeByte(9)
      ..write(obj.isPinSet)
      ..writeByte(10)
      ..write(obj.profile)
      ..writeByte(11)
      ..write(obj.Address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
