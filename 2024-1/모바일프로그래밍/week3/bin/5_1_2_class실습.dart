void main() {
  var apiData = [
    {"name": "강해솔", "major": "글로벌미디어학부", "studentID": 20200001},
    {"name": "고광서", "major": "글로벌미디어학부", "studentID": 20200002},
    {"name": "권시경", "major": "글로벌미디어학부", "studentID": 20210001},
    {"name": "김민지", "major": "글로벌미디어학부", "studentID": 20200003},
    {"name": "김영우", "major": "글로벌미디어학부", "studentID": 20200004},
    {"name": "김종겸", "major": "글로벌미디어학부", "studentID": 20190001},
    {"name": "김준서", "major": "글로벌미디어학부", "studentID": 20190002},
    {"name": "김준영", "major": "글로벌미디어학부", "studentID": 20210002},
    {"name": "김철현", "major": "컴퓨터학부", "studentID": 20210003},
    {"name": "김하연", "major": "글로벌미디어학부", "studentID": 20200005},
    {"name": "김한슬", "major": "글로벌미디어학부", "studentID": 20220001},
    {"name": "도혜진", "major": "글로벌미디어학부", "studentID": 20200006},
    {"name": "레티타잉화", "major": "글로벌미디어학부", "studentID": 20200007},
    {"name": "문세종", "major": "글로벌미디어학부", "studentID": 20200008},
    {"name": "박시윤", "major": "글로벌미디어학부", "studentID": 20210004},
    {"name": "박아연", "major": "글로벌미디어학부", "studentID": 20200009},
    {"name": "박요셉", "major": "철학과", "studentID": 20190003},
    {"name": "박지성", "major": "글로벌미디어학부", "studentID": 20210005},
    {"name": "박혜정", "major": "글로벌미디어학부", "studentID": 20210006},
    {"name": "백민서", "major": "글로벌미디어학부", "studentID": 20200010},
    {"name": "부티녹바오", "major": "글로벌미디어학부", "studentID": 20210007},
    {"name": "서수민", "major": "글로벌미디어학부", "studentID": 20210008},
    {"name": "서지우", "major": "글로벌미디어학부", "studentID": 20200011},
    {"name": "서채연", "major": "글로벌미디어학부", "studentID": 20200012},
    {"name": "송아정", "major": "글로벌미디어학부", "studentID": 20210009},
    {"name": "안재환", "major": "글로벌미디어학부", "studentID": 20190004},
    {"name": "유소택", "major": "글로벌미디어학부", "studentID": 20180001},
    {"name": "유운", "major": "글로벌미디어학부", "studentID": 20210010},
    {"name": "이건", "major": "전자정보공학부(IT융합)", "studentID": 20180002},
    {"name": "이용섭", "major": "글로벌미디어학부", "studentID": 20190005},
    {"name": "장우영", "major": "글로벌미디어학부", "studentID": 20210011},
    {"name": "정민학", "major": "글로벌미디어학부", "studentID": 20180003},
    {"name": "정혜미", "major": "글로벌미디어학부", "studentID": 20210012},
    {"name": "조다은", "major": "글로벌미디어학부", "studentID": 20200013},
    {"name": "조연정", "major": "글로벌미디어학부", "studentID": 20210013},
    {"name": "조은기", "major": "글로벌미디어학부", "studentID": 20180004},
    {"name": "쩐광빈", "major": "글로벌미디어학부", "studentID": 20200014},
    {"name": "추가연", "major": "글로벌미디어학부", "studentID": 20190006},
    {"name": "테티아나", "major": "글로벌미디어학부", "studentID": 20200015},
  ];

  for (var studentJson in apiData) {
    // 일일이 분해해서 넣어주기.
    // var student = Student(name: studentJson['name'], major: studentJson['major'], studentID: studentJson['studentID']);

    // Named Constructor을 이용해서, 한 번에 Map을 넘기고 알아서 객체 생성하게 하기.
    var student = Student.fromJSON(studentJson);
    student.sayHello();
  }
}

class Student {
  String name;
  String major;
  int studentID;

  Student.fromJSON(Map<String, dynamic> studentJson)
      : name = studentJson['name'],
        major = studentJson['major'],
        studentID = studentJson['studentID'];

  void sayHello() =>
      print('안녕하세요. 제 이름은 $name입니다. 전공은 $major이고 학번은 $studentID입니다.');
}
