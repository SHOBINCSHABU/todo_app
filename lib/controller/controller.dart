import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/model.dart';

class TodoController {
  static List todolistKey = [];
  static var myBox = Hive.box<TodoModel>('todoBox');

  static deleteData(var Key) async {
    await myBox.delete(Key);
    initKey();
  }

  static addData(TodoModel item) async {
    await myBox.add(item);
    initKey();
  }

  static initKey() {
    todolistKey = myBox.keys.toList();
  }

  static TodoModel? getdata(var key) {
    return myBox.get(key);
  }

  static checkBox(var key, TodoModel todoModel) async {
    await myBox.put(key, todoModel);
    initKey();
  }
}
