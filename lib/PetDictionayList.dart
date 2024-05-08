import 'package:asset/template/Disease.dart';
import 'package:asset/template/DiseaseDetailTemplate.dart';
import 'package:flutter/material.dart';

class PetDictionaryList extends StatefulWidget {
  @override
  _PetDictionaryListState createState() => _PetDictionaryListState();
}

class _PetDictionaryListState extends State<PetDictionaryList> {
  List<Disease> diseases = [
    Disease(
        name: "백내장",
        definition: "원래 투명했던 수정체가 뿌옇게 변성되는 질환",
        causes: "외상, 약물, 장시간 자외선 노출 등 다양한 요소가 원인이 될 수 있어요.",
        homeCare: "정기적인 검진이 필요하고, 6세 이후로는 매년 안과검사가 필요해요.",
        symptoms: "수정체에 뿌옇게 백탁이 생길 수 있어요.",
        prevention:
            "영양제 복용으로 진행속도를 늦출 수 있어요. 또한 안과에서 처방하는 백내장 지연제를 안약으로 사용해볼 수 있어요."),
    Disease(
        name: "안검염",
        definition: "안검의 염증성 질환",
        causes: "피부염, 알러지성, 자가면역원성 등 다양한 원인에 의해 발생해요.",
        homeCare: "안과 전문 병원에서 검진받는 것을 추천드려요.",
        symptoms: "결막과 눈 주위읭 부종, 결막 충혈, 소양감, 끈적끈적한 노란 눈곱이 관찰될 수 있어요.",
        prevention: "예방하는 별도의 방법은 없어요."),
    Disease(
        name: "안검종양",
        definition: "안검에서 생성된 양성 또는 악성의 신생물",
        causes: "감염성, 면역원성, 환경적 요인(자외선, 강한 햇빛) 영향에 의해 발생해요.",
        homeCare: "동물병원에서 제거하는 것을 추천드려요.",
        symptoms: "안검에 생긴 종양이 관찰돼요.",
        prevention: "예방하는 별도의 방법은 없어요."),
    Disease(
        name: "안검내반증",
        definition: "안검이 눈 안쪽을 향하여 말려있는 질환",
        causes:
            "안검 자체의 형성 문제와 같은 구조적 원인에 의해, 통증이 있는 경우 안검 경련에 의해, 수술 혹은 상처에 의한 반흔성 원인에 의해 발생할 수 있어요.",
        homeCare: "안과 전문 병원에서 검진받는 것을 추천드려요.",
        symptoms: "유루증, 결막의 충혈, 안검 경련, 눈 주위의 탈모와 급성 각막 궤양이 관찰될 수 있어요.",
        prevention: "예방하는 별도의 방법은 없어요."),
    Disease(
        name: "유루증",
        definition: "눈물이 안검 바깥쪽으로 넘쳐흐르는 증상의 질환",
        causes: "비루관계의 폐색을 일으키는 원인이나 눈물이 과도하게 생성되는 원인으로 나눠져요.",
        homeCare: "눈 주변을 청결하게 자주 닦아주세요.",
        symptoms: "눈물이 밖으로 흘러서 넘쳐요.",
        prevention: "비루공계가 막힐 수 있는 질환에 대한 치료를 해주세요."),
    Disease(
        name: "색소침착성각막염",
        definition: "각막의 멜라닌 색소 침착이 동반된 염증성 질환",
        causes: "내안각 내반, 내측 두줄속눈썹, 안구건조증 등 각막에 만성적인 자극이 가해질 경우 발생해요.",
        homeCare: "안과 전문 병원에서 검진을 추천해요.",
        symptoms: "각막에 까맣게 선 혹은 면이 생겨요.",
        prevention: "예방하는 별도의 방법은 없어요."),
    Disease(
        name: "궤양성각막염",
        definition: "각막에 궤양과 염증이 같이 발생하는 질환",
        causes: "외상, 눈물층의 이상, 감염 그리고 신경과 관련된 질병에 의해 발생할 수 있어요.",
        homeCare: "안과 전문 병원에서 검진받는 것을 추천해요.",
        symptoms: "결막이 빨갛게 충혈되고 안검의 경련, 각막 부종과 함께 눈곱이 생길 수 있어요.",
        prevention: "안찜질 또는 인공눈물을 수시로 점안해주세요."),
    Disease(
        name: "비궤양성각막염",
        definition: "각막의 염증성 질환",
        causes: "내안각 내반, 내측 두줄속눈썹, 안구건조증 등 각막에 만성적인 자극이 가해질 경우 발생해요.",
        homeCare: "병원에서 원인을 확인해보아야해요.",
        symptoms: "각막이 혼탁해지고, 심한경우 검은색으로 되는 경우가 있어요.",
        prevention: "안찜질 또는 인공눈물을 수시로 점안해주세요."),
    Disease(
        name: "핵경화",
        definition: "나이가 들면 생길 수 있는 수정체 중심에 늙은 세포가 모여 짙어지는 질환",
        causes: "노화로 인해 발생해요.",
        homeCare: "안과 전문 병원에서 검진받는 것을 추천해요.",
        symptoms: "수정체가 뿌옇게 보여 백내장과 혼동하기 쉬우나 더 청색으로 보이고 전체적으로 뿌옇게 시작해 점차 진해져요.",
        prevention: "예방하는 별도의 방법은 없어요."),
    Disease(
        name: "결막염",
        definition: "결막의 염증성 질환",
        causes: "세균성, 바이러스성, 곰팡이성, 면역매개성 등 다양한 원인이 있어요.",
        homeCare: "안과 전문 병원에서 검진받는 것을 추천해요.",
        symptoms: "결막과 눈 주위의 부종, 결막 충혈, 소양감, 끈적끈적한 노란 눈곱이 관찰될 수 있어요.",
        prevention: "예방하는 별도의 방법은 없어요."),
    Disease(
        name: "각막부골편",
        definition: "고양이 특유의 각막질환",
        causes: "아직 정확한 원인은 밝혀지지 않았으나, 각막궤양이나 헤르페스바이러스가 원인으로 뽑혀요.",
        homeCare: "병원에서 원인을 확인해보아야해요.",
        symptoms: "검붉은 농성 분비물이 생길 수 있어요.",
        prevention: "예방하는 별도의 방법은 없어요."),
    Disease(
        name: "각막궤양",
        definition: "각막에 상처가 나 생기는 질환",
        causes: "눈에 이물질이 들어가거나 속눈썹이 자극하여 상처가 생길 수 있어요.",
        homeCare: "시기를 놓치면 회생 불가능하므로 급히 병원에 가야 해요.",
        symptoms: "통증으로 눈을 뜨지 못하고 눈물을 심하게 흘리며 빛을 보지 못해요.",
        prevention: "속눈썹을 세심히 살펴주고 발톱 관리를 해주는 것이 좋아요."),
    Disease(
        name: "구진",
        definition: "세균염 피부 질환",
        causes: "포도상구균이 원인이 되는 경우가 많아요.",
        homeCare: "병원에서 원인을 확인해보아야해요.",
        symptoms: "피부가 빨갛게 되고 우둘투둘한 부스럼이 생겨요.",
        prevention: "예방하는 별도의 방법은 없어요."),
    Disease(
        name: "비듬",
        definition: "피부에 표피가 벗겨지는 질환",
        causes: "피부에 자극이 있거나 피부질환에 걸리면 생기게 돼요.",
        homeCare: "피부 건강 유지에 필요한 단백질을 사료나 비타민으로 채워주세요.",
        symptoms: "피부가 빨갛게 되고 각질처럼 하양 표피층이 벗겨져요.",
        prevention: "환경이 너무 건조하지 않게 유지하거나, 드라이어로 털을 건조할 때 너무 많은 열을 쬐지 않게 해야해요."),
    Disease(
        name: "여드름",
        definition: "모낭에 생기는 급성화농성 염증에 의한 질환",
        causes: "피지선 이상으로 발생돼요.",
        homeCare: "병원에서 원인을 확인해보아야해요.",
        symptoms: "피부에 여드름처럼 생기게 돼요.",
        prevention: "예방하는 별도의 방법은 없어요."),
    Disease(
        name: "구진",
        definition: "세균염 피부 질환",
        causes: "포도상구균이 원인이 되는 경우가 많아요.",
        homeCare: "병원에서 원인을 확인해보아야해요.",
        symptoms: "피부가 빨갛게 되고 우둘투둘한 부스럼이 생겨요.",
        prevention: "예방하는 별도의 방법은 없어요."),
  ];

  List<Disease> filteredDiseases = [];

  @override
  void initState() {
    super.initState();
    filteredDiseases = diseases;
  }

  void searchDisease(String query) {
    final results = diseases
        .where((disease) =>
            disease.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredDiseases = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("질병 목록"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DiseaseSearch(diseases));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredDiseases.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredDiseases[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DiseaseDetailPage(disease: filteredDiseases[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class DiseaseSearch extends SearchDelegate<Disease?> {
  final List<Disease> diseases;

  DiseaseSearch(this.diseases);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = diseases.where((disease) =>
        disease.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(results[index].name),
        onTap: () {
          close(context, results[index]);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = diseases.where((disease) =>
        disease.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index].name),
        onTap: () {
          query = suggestions[index].name;
          showResults(context);
        },
      ),
    );
  }
}

