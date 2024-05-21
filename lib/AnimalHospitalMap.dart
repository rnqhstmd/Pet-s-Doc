import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Google Maps 패키지 import
import 'package:csv/csv.dart';
import 'package:geolocator/geolocator.dart';

class AnimalHospitalMap extends StatefulWidget {
  @override
  _AnimalHospitalMapState createState() => _AnimalHospitalMapState();
}

class _AnimalHospitalMapState extends State<AnimalHospitalMap> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  LatLng? _currentLocation; // 사용자의 현재 위치 저장
  bool _myLocationEnabled = false;  // 위치 기능 활성화 여부

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();  // 위치 권한 확인
    loadHospitalData(); // 데이터 로드
  }

  void _checkLocationPermission() async {
    final status = await Geolocator.checkPermission();  // 권한 상태 확인
    if (status == LocationPermission.denied) {
      await Geolocator.requestPermission();  // 권한 요청
    }
    _getCurrentLocation();  // 현재 위치 가져오기
  }

  void _getCurrentLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition();  // 현재 위치
      print("Current Position: ${position.latitude}, ${position.longitude}");  // 위치 로그
      _currentLocation = LatLng(position.latitude, position.longitude);  // 현재 위치 저장
      setState(() {
        _myLocationEnabled = true;  // 위치 기능 활성화
      });
    } catch (e) {
      print("Error getting current location: $e");
    }
  }

  void loadHospitalData() async {
    final csvData =
        await rootBundle.loadString('assets/csv/AnimalHospital.csv');
    List<List<dynamic>> rows =
        const CsvToListConverter().convert(csvData, eol: '\n');

    for (int i = 1; i < rows.length; i++) {
      List<dynamic> row = rows[i];
      try {
        final latitude = double.parse(row[2].toString());
        final longitude = double.parse(row[3].toString());
        final name = row[4].toString();
        final address = row[1].toString();

        setState(() {
          _markers.add(Marker(
            markerId: MarkerId(name),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(title: name, snippet: address),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet),
          ));
        });
      } catch (e) {
        continue;
      }
    }
  }



  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _animateToCurrentLocation();  // 지도 생성 후 현재 위치로 이동
  }

  void _animateToCurrentLocation() {
    if (_currentLocation != null && mapController != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentLocation!,  // 사용자 위치로 이동
            zoom: 15,  // 확대 수준
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('동물병원 위치'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _currentLocation ?? LatLng(37.5665, 126.9780), // 초기 위치 설정
          zoom: 12,
        ),
        myLocationEnabled: _myLocationEnabled,  // 위치 기능 활성화
        myLocationButtonEnabled: false,  // 기본 위치 버튼 비활성화
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateToCurrentLocation,  // 현재 위치로 이동
        foregroundColor: Colors.black,  // 아이콘 색상
        backgroundColor: Colors.white,  // 버튼 색상
        child: Icon(Icons.my_location),  // 위치 아이콘
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,  // 왼쪽 아래 위치
    );
  }
}
