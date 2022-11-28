// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseForm _$$_CourseFormFromJson(Map<String, dynamic> json) =>
    _$_CourseForm(
      id: json['id'] as String,
      name: json['name'] as String,
      fatherName: json['fatherName'] as String,
      idNo: json['idNo'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      courseType: json['courseType'] as String,
      carType: json['carType'] as String,
      dayType: json['dayType'] as String,
      initialDay: DateTime.parse(json['initialDay'] as String),
      timeType: json['timeType'] as String,
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
      userID: json['userID'] as String,
      isConfirmed: json['isConfirmed'] as bool,
      bankSlipImage: json['bankSlipImage'] as String?,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_CourseFormToJson(_$_CourseForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fatherName': instance.fatherName,
      'idNo': instance.idNo,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'courseType': instance.courseType,
      'carType': instance.carType,
      'dayType': instance.dayType,
      'initialDay': instance.initialDay.toIso8601String(),
      'timeType': instance.timeType,
      'price': instance.price.toJson(),
      'userID': instance.userID,
      'isConfirmed': instance.isConfirmed,
      'bankSlipImage': instance.bankSlipImage,
      'dateTime': instance.dateTime.toIso8601String(),
    };
