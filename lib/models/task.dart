import 'package:dooit/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

class Task {
  int? taskId;
  String? taskTitle;
  bool? taksIsPinned;
  int? taskLabelId;

  static final Task instance = Task._constractor();

  Task._constractor();

  Task.create({
    required this.taskId,
    required this.taskTitle,
    required this.taksIsPinned,
    required this.taskLabelId,
  });

  final database = DatabaseService.instance;

  Task getTaskFromMap(Map<dynamic, dynamic> taskData) {
    return Task.create(
      taskId: taskData["taskId"],
      taskTitle: taskData["taskTitle"],
      taksIsPinned: taskData["taksIsPinned"],
      taskLabelId: taskData["taskLabel_id"],
    );
  }

  Future<Task> addTask(Task task) async {
    late int taskId;
    final Database db = await database.getDatabase();
    db.transaction((txn) async {
      taskId = await txn.rawInsert(
        '''INSERT INTO Task(taskTitle,taskIsPinned,taskLabel_id) VALUES(?,?,?);''',
        [task.taskTitle, (task.taksIsPinned!) ? 1 : 0, task.taskLabelId],
      );
    });
    db.close();
    task.taskId = taskId;
    return task;
  }

  Future<List<Task>> getListTask({bool pinnedOnly = false}) async {
    final Database db = await database.getDatabase();

    List<Map> listData = pinnedOnly
        ? await db.rawQuery(
            '''SELECT * FROM Task WHERE taskIsPinned=1''',
            [pinnedOnly],
          )
        : await db.rawQuery('''SELECT * FROM Task''');
    db.close();
    List<Task> listTask = listData
        .map((taskData) => getTaskFromMap(taskData))
        .toList();
    return listTask;
  }

  Future<Task> getTaskById(int taskId) async {
    final Database db = await database.getDatabase();

    List<Map> taskData = await db.rawQuery(
      '''SELECT * FROM Task WHERE taskId=?''',
      [taskId],
    );
    db.close();
    Task task = getTaskFromMap(taskData.first);
    return task;
  }
}
