import 'dart:io';
import 'package:asset/template/AppTemplate.dart'; // 경로가 올바른지 확인하세요.
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'AnalysisResult.dart'; // 이 파일의 경로도 확인하세요.

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // 결과 페이지로 이미지 파일을 전달
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AnalysisResult(imageFile: _image!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // AppTemplate을 사용하여 레이아웃을 구성합니다.
    return AppTemplate(
      currentIndex: 0, // 현재 선택된 탭의 인덱스
      bodyContent: _buildBodyContent(), // 본문 콘텐츠를 빌드하는 메서드를 분리합니다.
    );
  }

  Widget _buildBodyContent() {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "사진 한장으로 내 아이를 \n직접 체크해보세요! ",
                  textAlign: TextAlign.center,
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
                  _buildFeatureButton(
                    label: '사진 업로드',
                    icon: Icons.upload_rounded,
                    onTap: () => _pickImage(ImageSource.gallery),
                  ),
                  _buildFeatureButton(
                    label: '사진 촬영',
                    icon: Icons.camera_alt_rounded,
                    onTap: () => _pickImage(ImageSource.camera),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }

  Widget _buildFeatureButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1), // 각 값에 적절한 오프셋 설정
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 80),
            Text(label, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
