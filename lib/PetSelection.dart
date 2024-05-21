import 'package:flutter/material.dart';

import 'SkinEyeSelection.dart';

class PetSelectionScreen extends StatefulWidget {
  @override
  _PetSelectionScreenState createState() => _PetSelectionScreenState();
}

class _PetSelectionScreenState extends State<PetSelectionScreen> {
  void _navigateToPetSelectionScreen() {
    // MainScreen으로 이동하는 로직을 정의합니다.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SkinEyeSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white, // 상단은 흰색
                Color(0xFF95D080),
              ] // 하단은 #F4FEF0 색상으로 그라데이션
              ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '당신의 반려동물을 선택하세요!',
                style: TextStyle(
                  fontFamily: "Jua",
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildPetButton(
                  context: context,
                  label: '강아지',
                  imageAsset: 'assets/images/dog.png',
                  onTap: _navigateToPetSelectionScreen,
                ),
                _buildPetButton(
                  context: context,
                  label: '고양이',
                  imageAsset: 'assets/images/cat.png',
                  onTap: _navigateToPetSelectionScreen
                ),
              ],
            ),
          ],
        ),
      ),
      // 나머지 Scaffold 구성요소들 (예: bottomNavigationBar)
    );
  }

  Widget _buildPetButton({
    required String label,
    required String imageAsset,
    required BuildContext context,
    required VoidCallback onTap, // 탭 이벤트 핸들러
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SkinEyeSelectionScreen()),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 170,
            // 컨테이너의 너비 설정
            height: 170,
            // 컨테이너의 높이 설정
            decoration: BoxDecoration(
              // 여기에 원하는 디자인 추가 가능
              color: Colors.white, // 배경색
              borderRadius: BorderRadius.circular(20), // 모서리 둥글기
              boxShadow: [
                // 그림자 효과
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            // 이미지 주변에 패딩 설정
            child: Image.asset(imageAsset), // 이미지 추가
          ),
          SizedBox(height: 8), // 이미지와 텍스트 사이 간격
          Text(label), // 레이블 텍스트
        ],
      ),
    );
  }
}
