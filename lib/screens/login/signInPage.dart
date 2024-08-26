/* 로그인 페이지 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodplace/services/API.dart';

// 로그인 상태 관리 페이지
import 'package:foodplace/components/loginStatus.dart';

// 회원가입 페이지
import 'package:foodplace/screens/login/signUpPage.dart';

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
  bool switchValue = false;

  // ID
  final TextEditingController idController = TextEditingController();
  // PW
  final TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<Login>(context);

    return Scaffold(
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
                    // 회원가입 버튼
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // 회원가입 페이지 이동
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        "회원 가입",
                      ),
                    ),
                    Text('    '),
                    // 로그인 버튼
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () async {
                            final Map loginCheck = await APIPost(
                                path: "/user/signIn",
                                params: {
                                  "email": idController.text,
                                  "pwd": pwdController.text
                                });

                            if (loginCheck['status'] == 400) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('알림'),
                                    content: Text(loginCheck['message']),
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
                            } else if (loginCheck['status'] == 200) {
                              loginStatus.logIn(loginCheck['results'][0]);

                              Navigator.of(context).pop(true);
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
    );
  }
}
