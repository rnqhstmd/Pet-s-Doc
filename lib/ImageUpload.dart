import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'AnimalHospitalMap.dart';
class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isUploading = true;
      });

      // TODO: 업로드 로직 구현
      // 예: Cloud storage에 업로드하는 함수를 호출하고 완료 콜백을 기다립니다.

      // 임시적으로 업로드가 '완료'되었다고 가정합니다.
      // 실제로는 외부 서비스에 업로드 후 결과를 받아야 합니다.
      await Future.delayed(Duration(seconds: 2)); // 로딩 시간 흉내
      setState(() {
        _isUploading = false;
      });
    }
  }

  void _navigateToMap() {
    // AnimalHospitalMap 화면으로 네비게이트
    Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalHospitalMap()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이미지 업로드'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(_image!)
            else if (_isUploading)
              CircularProgressIndicator()
            else
              Text('이미지를 업로드해주세요.'),
            ElevatedButton(
              onPressed: _isUploading ? null : _pickImage,
              child: Text('이미지 선택'),
            ),
            SizedBox(height: 20),  // 버튼 간 간격 추가
            ElevatedButton(
              onPressed: _isUploading ? null : _navigateToMap,
              child: Text('동물병원 지도 보기'),
            ),
          ],
        ),
      ),
    );
  }
}
