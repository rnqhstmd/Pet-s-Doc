import 'package:flutter/material.dart';
import '../solution/PetDictionayList.dart';
import '../PetSelection.dart';
import '../AnimalHospitalMap.dart';

class AppTemplate extends StatefulWidget {
  final int currentIndex;
  final Widget bodyContent;

  AppTemplate({
    required this.currentIndex,
    required this.bodyContent,
  });

  @override
  _AppTemplateState createState() => _AppTemplateState();
}

class _AppTemplateState extends State<AppTemplate> {
  void _onItemTapped(int index) {
    if (index != widget.currentIndex) {
      Widget nextPage;
      switch (index) {
        case 0:
          nextPage = PetSelectionScreen();
          break;
        case 1:
          nextPage = PetDictionaryList();
          break;
        case 2:
          nextPage = AnimalHospitalMap();
          break;
        default:
          return;
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => nextPage),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFF95D080)], // 그라디언트 배경색 설정
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // 원하는 크기의 마진을 설정
          child: widget.bodyContent, // 이곳에 bodyContent를 넣습니다.
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "펫과사전",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: "주변 동물병원 찾기",
          ),
        ],
      ),
    );
  }
}
