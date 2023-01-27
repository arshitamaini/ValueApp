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

    info = (json['info'] as Map<String, dynamic>?) != null
        ? Info.fromJson(json['info'] as Map<String, dynamic>)
        : null;
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
  String? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? password;

  Info({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.password,
  });

  Info.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    name = json['name'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    email = json['email'] as String?;
    password = json['password'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['name'] = name;
    json['phoneNumber'] = phoneNumber;
    json['email'] = email;
    json['password'] = password;

    return json;
  }
}
