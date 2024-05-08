import 'package:flutter/material.dart';

import '../AnimalHospitalMap.dart';
import '../PetDictionayList.dart';
import '../PetSelection.dart';

class AppTemplate extends StatefulWidget {
  final int currentIndex;
  final Widget bodyContent;  // 현재 페이지 내용을 위한 위젯

  AppTemplate({required this.currentIndex, required this.bodyContent});

  @override
  _AppTemplateState createState() => _AppTemplateState();
}

class _AppTemplateState extends State<AppTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFF95D080)],
          ),
        ),
        child: widget.bodyContent,  // 동적으로 내용을 받아서 표시
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        selectedItemColor: Colors.greenAccent,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "펫과사전",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_location),
            label: "주변 동물병원 찾기",
          ),
        ],
      ),
    );
  }

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
        MaterialPageRoute(builder: (context) => AppTemplate(currentIndex: index, bodyContent: nextPage)),
      );
    }
  }
}
