class BaseModel {
  int? id;
  BaseModel();

  BaseModel.fromJson(Map<dynamic, dynamic> parsedJson) : id = parsedJson['id'];

  Map<dynamic, dynamic> toJson() => {
        "id": id.toString(),
      };
}
