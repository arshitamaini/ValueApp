class NewTaskModel {
  bool? success;
  String? message;
  int? code;
  Info? info;

  NewTaskModel({
    this.success,
    this.message,
    this.code,
    this.info,
  });

  NewTaskModel.fromJson(Map<String, dynamic> json) {
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
  String? taskTitle;
  String? taskDescription;
  String? userId;
  String? id;
  int? v;

  Info({
    this.taskTitle,
    this.taskDescription,
    this.userId,
    this.id,
    this.v,
  });

  Info.fromJson(Map<String, dynamic> json) {
    taskTitle = json['taskTitle'] as String?;
    taskDescription = json['taskDescription'] as String?;
    userId = json['userId'] as String?;
    id = json['_id'] as String?;
    v = json['__v'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['taskTitle'] = taskTitle;
    json['taskDescription'] = taskDescription;
    json['userId'] = userId;
    json['_id'] = id;
    json['__v'] = v;
    return json;
  }
}