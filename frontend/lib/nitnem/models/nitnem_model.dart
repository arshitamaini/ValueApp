class NitnemTaskModel {
  bool? success;
  String? message;
  int? code;
  int? count;
  List<Info>? info;

  NitnemTaskModel({
    this.success,
    this.message,
    this.code,
    this.count,
    this.info,
  });

  NitnemTaskModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    code = json['code'] as int?;
    count = json['count'] as int?;
    info = (json['info'] as List?)?.map((dynamic e) => Info.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['success'] = success;
    json['message'] = message;
    json['code'] = code;
    json['count'] = count;
    json['info'] = info?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Info {
  String? id;
  String? name;
  String? gurmukhiContent;
  String? hindiContent;
  String? englishContent;

  Info({
    this.id,
    this.name,
    this.gurmukhiContent,
    this.hindiContent,
    this.englishContent,
  });

  Info.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    name = json['name'] as String?;
    gurmukhiContent = json['gurmukhiContent'] as String?;
    hindiContent = json['hindiContent'] as String?;
    englishContent = json['englishContent'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['name'] = name;
    json['gurmukhiContent'] = gurmukhiContent;
    json['hindiContent'] = hindiContent;
    json['englishContent'] = englishContent;
    return json;
  }
}