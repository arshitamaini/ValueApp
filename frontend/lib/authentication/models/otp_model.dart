class OtpModel {
  bool? success;
  String? message;
  int? code;
  Info? info;

  OtpModel({
    this.success,
    this.message,
    this.code,
    this.info,
  });

  OtpModel.fromJson(Map<String, dynamic> json) {
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
  String? otp;

  Info({
    this.otp,
  });

  Info.fromJson(Map<String, dynamic> json) {
    otp = json['otp'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['otp'] = otp;
    return json;
  }
}