import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodplace/models/sql.dart';
import 'package:foodplace/screens/login/signUpPage.dart';
import 'package:foodplace/main.dart';

// 로그인 페이지
class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _LoginState();
}

class _LoginState extends State<SignInPage> {
  bool isLogin = false;
  bool switchValue = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

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
                      placeholder: "아이디를 입력해주세요",
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
                      placeholder: "비밀번호를 입력해주세요",
                      textAlign: TextAlign.center,
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          "회원 가입",
                        ),
                      ),
                      Text('    '),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: ElevatedButton(
                            onPressed: () async {
                              final loginCheck = await login(
                                  idController.text, pwdController.text);
                              print(loginCheck);

                              // 로그인 확인
                              if (loginCheck == '-1') {
                                print('로그인 실패');
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('알림'),
                                      content: Text('아이디 또는 비밀번호가 올바르지 않습니다.'),
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
                              } else {
                                print('로그인 성공');
                                isLogin = true;

                                // 메인 페이지로 이동
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyApp(isLogin,),
                                  ),
                                );
                              }
                            },
                            child: Text('로그인'),
                          ),
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