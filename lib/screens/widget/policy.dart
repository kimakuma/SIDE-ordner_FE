import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  final String type;

  Policy({Key? key, required this.type}) : super(key: key);

  String get content {
    return contents();
  }

  String contents() {
    if (type == "이용규칙") {
      return type + "\n추가 예정입니다.";
    } else if (type == "기본 규칙") {
      return type + "\n추가 예정입니다.";
    } else if (type == "재예약 및 환불 정책") {
      return type + "\n추가 예정입니다.";
    } else if (type == "청구의 조치") {
      return type + "\n추가 예정입니다.";
    } else if (type == "이용 약관") {
      return type + "\n추가 예정입니다.";
    } else if (type == "결제 서비스 약관") {
      return type + "\n추가 예정입니다.";
    } else if (type == "개인정보 처리방침") {
      return type + "\n추가 예정입니다.";
    } else {
      return "추가 예정입니다.";
    }
  }

  void bottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (_, controller) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: ListView(
                controller: controller,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(content)),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // This widget doesn't render anything by itself
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
