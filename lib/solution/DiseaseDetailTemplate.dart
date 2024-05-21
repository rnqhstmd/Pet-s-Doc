import 'package:flutter/material.dart';

import 'Disease.dart';

class DiseaseDetailPage extends StatelessWidget {
  final Disease disease;

  DiseaseDetailPage({required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disease.name, style: TextStyle(fontFamily:"Jua", fontSize: 25)),
        backgroundColor: Color(0xFF95D080), // 상단 바 색상 조정
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSection(context, '정의', disease.definition),
              _buildSection(context, '원인', disease.causes),
              _buildSection(context, '홈케어 방법', disease.homeCare),
              _buildSection(context, '증상', disease.symptoms),
              _buildSection(context, '예방법', disease.prevention),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10), // 섹션 간 간격 추가
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(fontFamily: "Jua",fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF95D080))), // 헤더 스타일 조정
            SizedBox(height: 8),
            Text(content, style: TextStyle(fontFamily: "Jua", fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
