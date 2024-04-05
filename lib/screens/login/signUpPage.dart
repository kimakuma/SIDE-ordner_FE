/* 회원가입 페이지 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:foodplace/models/sql.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  // ID
  final TextEditingController idController = TextEditingController();
  // PW
  final TextEditingController pwdController = TextEditingController();
  // PW 재입력
  final TextEditingController pwdVerifyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: CupertinoTextField(
                      controller: idController,
                      placeholder: '아이디를 입력해주세요',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: CupertinoTextField(
                      controller: pwdController,
                      placeholder: '비밀번호를 입력해주세요',
                      textAlign: TextAlign.center,
                      obscureText: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: CupertinoTextField(
                      controller: pwdVerifyController,
                      placeholder: '비밀번호를 다시 입력해주세요',
                      textAlign: TextAlign.center,
                      obscureText: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 95,
                        child: OutlinedButton(
                          onPressed: () {
                            // 이전 화면(로그인 페이지) 이동
                            Navigator.of(context).pop();
                          },
                          child: Text('뒤로 가기'),
                        ),
                      ),
                      Text('   '),
                      // 계정 생성 버튼
                      SizedBox(
                        width: 195,
                        child: ElevatedButton(
                          onPressed: () async {
                            final idCheck = await confirmIdCheck(idController.text);

                            print('idCheck : $idCheck');

                            if (idCheck != '0') {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('알림'),
                                    content: Text('입력한 아이디가 이미 존재합니다.'),
                                    actions: [
                                      TextButton(
                                        child: Text('닫기'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            else if (pwdController.text !=
                                pwdVerifyController.text) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('알림'),
                                    content: Text('입력한 비밀번호가 같지 않습니다.'),
                                    actions: [
                                      TextButton(
                                        child: Text('닫기'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            else {
                              insertMember(idController.text,
                                  pwdController.text);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('알림'),
                                    content: Text('아이디가 생성되었습니다.'),
                                    actions: [
                                      TextButton(
                                        child: Text('닫기'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );

                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('계정 생성'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}