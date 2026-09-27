import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

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
  CustomerResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    numberOfNotifications = json['numberOfNotifications'];
  }
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
  ContactsResposne.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    link = json['link'];
  }
}

@JsonSerializable()
class AuthinticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contact")
  ContactsResposne? contact;
  AuthinticationResponse(this.customer, this.contact);
  AuthinticationResponse.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] == null ? null : CustomerResponse.fromJson(json['customer']);
    contact = json['contact'] == null ? null : ContactsResposne.fromJson(json['contact']);
    status = json['status'];
    message = json['message'];
  }
}
