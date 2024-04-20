import 'package:asset/PetSelection.dart';
import 'package:flutter/material.dart';
import 'SkinEyeSelection.dart'; // 메인 화면으로 이동하기 위한 import

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  _navigateToMainScreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PetSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF95D080),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 로고 이미지를 원형으로 표시
            ClipOval(
              child: Image.asset(
                'assets/images/logo.png',
                width: 100, // 로고의 크기를 조절
                height: 100,
              ),
            ),
            SizedBox(height: 20), // 로고와 텍스트 사이의 공간을 추가
            Text(
              '펫스닥',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // 앱 이름
          ],
        ),
      ),
    );
  }
}
