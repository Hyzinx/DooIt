import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constractor();
  DatabaseService._constractor();

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasepath = join(databaseDirPath, "master_db.db");
    final database = await openDatabase(
      databasepath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
            CREATE TABLE Label (
              labelId INTEGER PRIMARY KEY AUTOINCREMENT,
              labelName TEXT NOT NULL
            );
        ''');
        db.execute('''
            CREATE TABLE Task(
              taskId INTEGER PRIMARY KEY AUTOINCREMENT,
              taskTitle TEXT NOT NULL,
              taskIsPinned INTEGER DEFAULT 0,
              taskLabel_id INTEGER NOT NULL,
              FOREIGN KEY (taskLabel_id)
                REFERENCES Label (labelId)
            );
            ''');
        db.execute('''
            CREATE TABLE ToDo(
              ToDoId INTEGER PRIMARY KEY AUTOINCREMENT,
              TaskName TEXT NOT NULL,
              isDone INTEGER DEFAULT 0,
              toDoTask_id INTEGER NOT NULL,
              FOREIGN KEY (toDoTask_id)
                REFERENCES Task (taskId)
            );
            ''');
      },
    );
    return database;
  }
}
