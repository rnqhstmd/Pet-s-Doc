import 'package:flutter/material.dart';
import 'AppTemplate.dart'; // AppTemplate을 import하여 앱의 공통 레이아웃을 사용

class SolutionSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      currentIndex: 1, // 네비게이션 바에서 'Search'를 현재 선택된 아이템으로 지정
      bodyContent: Center(
        child: Text('의심 질환의 솔루션을 검색해보세요!'),
        // 실제 검색 기능을 구현할 위젯을 여기에 배치
      ),
    );
  }
}
