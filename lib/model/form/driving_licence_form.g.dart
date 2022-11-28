// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driving_licence_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DrivingLicenceForm _$$_DrivingLicenceFormFromJson(
        Map<String, dynamic> json) =>
    _$_DrivingLicenceForm(
      id: json['id'] as String,
      name: json['name'] as String,
      fatherName: json['fatherName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      idNo: json['idNo'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      licenceNo: json['licenceNo'] as String?,
      licenceExpiredDate: json['licenceExpiredDate'] as String?,
      licenceType: json['licenceType'] as String,
      serviceType: json['serviceType'] as String,
      isConfirmed: json['isConfirmed'] as bool,
      cost: json['cost'] as int,
      userId: json['userId'] as String,
      bankSlipImage: json['bankSlipImage'] as String?,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_DrivingLicenceFormToJson(
        _$_DrivingLicenceForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fatherName': instance.fatherName,
      'dateOfBirth': instance.dateOfBirth,
      'idNo': instance.idNo,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'licenceNo': instance.licenceNo,
      'licenceExpiredDate': instance.licenceExpiredDate,
      'licenceType': instance.licenceType,
      'serviceType': instance.serviceType,
      'isConfirmed': instance.isConfirmed,
      'cost': instance.cost,
      'userId': instance.userId,
      'bankSlipImage': instance.bankSlipImage,
      'dateTime': instance.dateTime.toIso8601String(),
    };
