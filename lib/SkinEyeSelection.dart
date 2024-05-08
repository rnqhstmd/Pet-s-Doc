import 'package:flutter/material.dart';
import 'ImageUpload.dart';
import 'template/AppTemplate.dart'; // AppTemplate 클래스를 import

enum BeautyChoice { eyes, skin }

class SkinEyeSelectionScreen extends StatefulWidget {
  @override
  _SkinEyeSelectionScreenState createState() => _SkinEyeSelectionScreenState();
}

class _SkinEyeSelectionScreenState extends State<SkinEyeSelectionScreen> {
  BeautyChoice? _choice;

  @override
  Widget build(BuildContext context) {
    // AppTemplate을 사용하여 레이아웃을 구성합니다.
    return AppTemplate(
      currentIndex: 0, // Home 탭을 현재 선택된 아이템으로 지정합니다.
      bodyContent: _buildBodyContent(), // 본문 콘텐츠를 빌드하는 메서드를 분리합니다.
    );
  }

  Widget _buildBodyContent() {
    // 본문 콘텐츠 구성을 별도의 메서드로 분리합니다.
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Color(0xFF95D080),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "3분만에 간단하게 진단받기!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFeatureButton(
                  label: '피부',
                  icon: Icons.face,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageUploadScreen()))),
              _buildFeatureButton(
                  label: '눈',
                  icon: Icons.remove_red_eye,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageUploadScreen()))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    // 버튼 구성 코드는 변동 없습니다.
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 60),
            Text(label, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
