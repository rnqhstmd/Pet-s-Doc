import 'package:flutter/material.dart';

import 'Disease.dart';

class DiseaseDetailPage extends StatelessWidget {
  final Disease disease;

  DiseaseDetailPage({required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disease.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('정의:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Text(disease.definition, style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('원인:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Text(disease.causes, style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('홈케어 방법:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Text(disease.homeCare, style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('증상:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Text(disease.symptoms, style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('예방법:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Text(disease.prevention, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
