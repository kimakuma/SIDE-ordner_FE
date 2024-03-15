// import 'package:flutter_memo_app/config/hashPassword.dart';
import 'package:foodplace/config/mysqlConnector.dart';
import 'package:mysql_client/mysql_client.dart';

// ID 중복 확인
Future<String?> confirmIdCheck(String id) async {
  final conn = await dbConnector();

  IResultSet? result;

  try {
    result = await conn.execute(
      "SELECT IFNULL((SELECT id FROM user WHERE id=:id), 0) as idCheck",
      {"id": id}
    );

    if (result.isNotEmpty) {
      for (final row in result.rows) {
        return row.colAt(0);
      }
    }
  } catch (e) {
    print('Error : $e');
  } finally {
    await conn.close();
  }

  return '-1';
}

// 계정 생성
Future<void> insertMember(String id, String pwd) async {
  final conn = await dbConnector();

  // 비밀번호 암호화
  // final hash = hashPassword(password);

  try {
    await conn.execute(
      "INSERT INTO user (id, pwd) VALUES (:id, :pwd)",
      {"id": id, "pwd": pwd}
    );
  } catch (e) {
    print('Error : $e');
  } finally {
    await conn.close();
  }
}

// 로그인
Future<String?> login(String id, String pwd) async {
  final conn = await dbConnector();

  // 비밀번호 암호화
  // final hash = hashPassword(password);

  IResultSet? result;

  try {
    result = await conn.execute(
      "SELECT id FROM user WHERE id = :id and pwd = :pwd",
      {"id": id, "pwd": pwd}
    );

    if (result.isNotEmpty) {
      for (final row in result.rows) {
        print(row.assoc());

        return row.colAt(0);
      }
    }
  } catch (e) {
    print('Error : $e');
  } finally {
    await conn.close();
  }

  return '-1';
}

