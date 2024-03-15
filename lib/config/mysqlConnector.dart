/* mySqlConnector.dart */
import 'package:mysql_client/mysql_client.dart';
// import 'package:flutter_memo_app/config/dbInfo.dart';

// MySQL 접속
Future<MySQLConnection> dbConnector() async {
  print("Connecting to mySQL Server...");

  // MySQL 접속 설정
  final conn = await MySQLConnection.createConnection(
    host: "localhost",
    port: 3306,
    userName: "root",
    password: "9909",
    databaseName: "foodplace",
  );

  await conn.connect();

  print("Connected mySQL Server");

  return conn;
}