import 'package:flutter/material.dart';
import 'AppTemplate.dart'; // AppTemplate을 import하여 앱의 공통 레이아웃을 사용

class PetDictionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      currentIndex: 2, // 네비게이션 바에서 'Tips'를 현재 선택된 아이템으로 지정
      bodyContent: Center(
        child: Text('애완동물 백과사전 목록'),
        // 애완동물 관련 정보나 꿀팁을 제공할 위젯을 여기에 배치
      ),
    );
  }
}
