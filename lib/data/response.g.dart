// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      json['id'] as String?,
      json['name'] as String?,
      (json['numberOfNotifications'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numberOfNotifications': instance.numberOfNotifications,
    };

ContactsResposne _$ContactsResposneFromJson(Map<String, dynamic> json) =>
    ContactsResposne(
      json['phone'] as String?,
      json['email'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContactsResposneToJson(ContactsResposne instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthinticationResponse _$AuthinticationResponseFromJson(
  Map<String, dynamic> json,
) =>
    AuthinticationResponse(
        json['customer'] == null
            ? null
            : CustomerResponse.fromJson(
                json['customer'] as Map<String, dynamic>,
              ),
        json['contact'] == null
            ? null
            : ContactsResposne.fromJson(
                json['contact'] as Map<String, dynamic>,
              ),
      )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthinticationResponseToJson(
  AuthinticationResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'customer': instance.customer,
  'contact': instance.contact,
};
