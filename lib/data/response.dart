import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numberOfNotifications")
  int? numberOfNotifications;
  CustomerResponse(this.id, this.name, this.numberOfNotifications);
}

@JsonSerializable()
class ContactsResposne {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  ContactsResposne(this.phone, this.email, this.link);
}

@JsonSerializable()
class AuthinticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contact")
  ContactsResposne? contact;
  AuthinticationResponse(this.customer, this.contact);
}
