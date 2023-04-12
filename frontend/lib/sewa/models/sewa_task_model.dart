class SewaModel {
  bool? success;
  String? message;
  int? code;
  int? count;
  List<Info>? info;

  SewaModel({
    this.success,
    this.message,
    this.code,
    this.count,
    this.info,
  });

  SewaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    code = json['code'] as int?;
    count = json['count'] as int?;
    info = (json['info'] as List?)
        ?.map((dynamic e) => Info.fromJson(e as Map<String, dynamic>))
        .toList();
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
  String? taskTitle;
  String? taskDescription;

  Info({
    this.id,
    this.taskTitle,
    this.taskDescription,
  });

  Info.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    taskTitle = json['taskTitle'] as String?;
    taskDescription = json['taskDescription'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['taskTitle'] = taskTitle;
    json['taskDescription'] = taskDescription;
    return json;
  }
}
