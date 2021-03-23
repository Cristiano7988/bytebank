import 'package:bytebank/models/transferencia.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE transferencias('
          'id INTEGER PRIMARY KEY, '
          'valor FLOAT, '
          'numero_conta INTEGER)');
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> save(Transferencia transferencia) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> transferenciaMap = Map();
  transferenciaMap['valor'] = transferencia.valor;
  transferenciaMap['numero_conta'] = transferencia.numeroConta;
  return db.insert('transferencias', transferenciaMap);
}

Future<List<Transferencia>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('transferencias');
  final List<Transferencia> transferencias = List();
  for (Map<String, dynamic> row in result) {
    final Transferencia transferencia = Transferencia(
      row['id'],
      row['valor'],
      row['numeroConta'],
    );
    transferencias.add(transferencia);
  }
  return transferencias;
}
