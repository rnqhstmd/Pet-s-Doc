import 'dart:io';
import 'package:asset/template/AppTemplate.dart';
import 'package:flutter/material.dart';

class AnalysisResult extends StatelessWidget {
  final File imageFile;

  AnalysisResult({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    // AppTemplate 사용하여 레이아웃 구성
    return AppTemplate(
      currentIndex: 0, // 현재 선택된 탭의 인덱스
      bodyContent: _buildContentContainer(context), // 본문 콘텐츠를 빌드하는 메서드를 분리합니다.
    );
  }

  // 분석 결과를 표시하는 위젯 구성
  Widget _buildContentContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '진단 결과',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(
              imageFile,
              width: MediaQuery.of(context).size.width - 64,
              height: 410,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          ..._buildConditionList(),
        ],
      ),
    );
  }

  List<Widget> _buildConditionList() {
    final Map<String, double> conditions = {
      '진드기': 82.0,
      '여드름': 13.0,
      '구진': 5.0,
    };

    return conditions.entries.map((entry) => _buildConditionRow(entry.key, entry.value)).toList();
  }

  // 진단 결과 각 항목을 보여주는 위젯
  Widget _buildConditionRow(String condition, double probability) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal:3),
      child: Container(
        decoration: BoxDecoration(

          border: Border.all(color: Colors.grey, width: 3), // 테두리 추가
          borderRadius: BorderRadius.circular(10), // 테두리 둥글게 처리
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                condition,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: LinearProgressIndicator(
                value: probability / 100,
                backgroundColor: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
                minHeight: 22,
              ),
            ),
            SizedBox(width: 13),
            Expanded(
              child: Text(
                '${probability.toStringAsFixed(1)}%',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
