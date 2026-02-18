import 'package:dooit/services/database_service.dart';

class Label {
  int labelId;
  final String labelName;
  Label({required this.labelId, required this.labelName});
  Label getLabelFromMap(Map<dynamic, dynamic> labelData) {
    return Label(
      labelId: labelData["labelId"],
      labelName: labelData["labelName"],
    );
  }

  final database = DatabaseService.instance;

  Future<Label> addLabel(Label label) async {
    late int labelId;
    final db = await database.getDatabase();
    await db.transaction((txn) async {
      labelId = await txn.rawInsert(
        '''
        INSERT INTO Label(LabelName) VALUES(؟);
    ''',
        [label.labelName],
      );
    });
    db.close();
    label.labelId = labelId;
    return label;
  }

  Future<List<Label>> getListOfLabels() async {
    final db = await database.getDatabase();
    List<Map> list = await db.rawQuery('''SELECT * FROM Label''');
    List<Label> listLabel = list
        .map((labelMap) => getLabelFromMap(labelMap))
        .toList();
    db.close();
    return listLabel;
  }

  Future<Label> getLabelById(int labelId) async {
    final db = await database.getDatabase();
    List<Map> labelData = await db.rawQuery(
      '''SELECT * FROM Label WHERE labelId=?''',
      [labelId],
    );
    db.close();
    Label label = getLabelFromMap(labelData.first);
    return label;
  }
}
