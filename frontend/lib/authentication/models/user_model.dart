class UserModel {
  bool? success;
  String? message;
  int? code;
  Info? info;

  UserModel({
    this.success,
    this.message,
    this.code,
    this.info,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    code = json['code'] as int?;
    info = (json['info'] as Map<String,dynamic>?) != null ? Info.fromJson(json['info'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['success'] = success;
    json['message'] = message;
    json['code'] = code;
    json['info'] = info?.toJson();
    return json;
  }
}

class Info {
  String? firstName;
  String? lastName;
  String? emailPhoneNumber;
  String? password;
  String? id;
  int? v;

  Info({
    this.firstName,
    this.lastName,
    this.emailPhoneNumber,
    this.password,
    this.id,
    this.v,
  });

  Info.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    emailPhoneNumber = json['emailPhoneNumber'] as String?;
    password = json['password'] as String?;
    id = json['_id'] as String?;
    v = json['__v'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['firstName'] = firstName;
    json['lastName'] = lastName;
    json['emailPhoneNumber'] = emailPhoneNumber;
    json['password'] = password;
    json['_id'] = id;
    json['__v'] = v;
    return json;
  }
}