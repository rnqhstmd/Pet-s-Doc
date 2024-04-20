import 'package:flutter/material.dart';
import 'PetSelection.dart'; // PetSelectionScreen 페이지를 예시로 import
import 'SolutionSearch.dart'; // SolutionSearchScreen 페이지를 예시로 import
import 'PetDictionary.dart'; // PetEncyclopediaScreen 페이지를 예시로 import

class AppTemplate extends StatelessWidget {
  final Widget bodyContent;
  final int currentIndex;

  AppTemplate({required this.bodyContent, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(170.0), // 앱 바의 높이를 늘립니다.
      //   child: AppBar(
      //     backgroundColor: Colors.transparent, // 앱 바의 배경색을 투명하게 설정
      //     elevation: 0, // 앱 바의 그림자를 제거
      //     centerTitle: true, // 제목을 중앙에 배치
      //     title: ClipOval(
      //       child: Image.asset(
      //         'assets/images/logo.png', // 로고 이미지 경로
      //         width: 120, // 로고의 너비를 조정
      //         height: 120, // 로고의 높이를 조정
      //       ),
      //     ),
      //   ),
      // ),
      // extendBodyBehindAppBar: true, // 앱 바 뒤로 내용을 확장
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFF95D080)],
          ),
        ),
        child: bodyContent,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.greenAccent,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PetSelectionScreen()));
            break;
          case 1:
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SolutionSearch()));
            break;
          case 2:
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PetDictionary()));
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets),
          label: "Tips",
        ),
      ],
    );
  }
}
