// ignore: flutter_style_todos
/// Model class for Todo
class Todo {
  ///
  Todo({
    this.id,
    this.title,
    this.done,
  });

  /// To do's id
  int? id;

  /// To do's title
  String? title;

  /// To do's status
  bool? done;

  /// Convert json to object
  // ignore: sort_constructors_first
  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json[_TodoParam.id.name] as int?,
        title: json[_TodoParam.title.name] as String?,
        done: json[_TodoParam.done.name] as bool?,
      );

  /// Convert object to json
  Map<String, dynamic> toJson() => {
        _TodoParam.id.name: id,
        _TodoParam.title.name: title,
        _TodoParam.done.name: done,
      };
}

/// Enum for to do parameters
enum _TodoParam {
  /// To do id
  id,

  /// To do title
  title,

  /// To do done
  done,
}
