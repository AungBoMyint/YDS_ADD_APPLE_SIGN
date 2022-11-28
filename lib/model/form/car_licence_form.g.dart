// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_licence_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CarLicenceForm _$$_CarLicenceFormFromJson(Map<String, dynamic> json) =>
    _$_CarLicenceForm(
      id: json['id'] as String,
      name: json['name'] as String,
      idNo: json['idNo'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      carNo: json['carNo'] as String,
      carExpiredDate: json['carExpiredDate'] as String,
      enginPowerType: json['enginPowerType'] as String,
      toDoFromOffice: json['toDoFromOffice'] as String?,
      isConfirmed: json['isConfirmed'] as bool,
      cost: json['cost'] as int,
      userId: json['userId'] as String,
      bankSlipImage: json['bankSlipImage'] as String?,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_CarLicenceFormToJson(_$_CarLicenceForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'idNo': instance.idNo,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'carNo': instance.carNo,
      'carExpiredDate': instance.carExpiredDate,
      'enginPowerType': instance.enginPowerType,
      'toDoFromOffice': instance.toDoFromOffice,
      'isConfirmed': instance.isConfirmed,
      'cost': instance.cost,
      'userId': instance.userId,
      'bankSlipImage': instance.bankSlipImage,
      'dateTime': instance.dateTime.toIso8601String(),
    };
