import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Hello Giraffe!',
              ),
            ),
            backgroundColor: Colors.orange,
          ),
          body: const Center(
            child: Icon(
              // 5. Icon: 화면의 아이콘은 Icon 클래스를 사용.
              Icons.access_alarm,
              size: 60,
              color: Colors.purple,
            ),
          )
          /*
        body: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            image: DecorationImage(
              // 4. Container 안에 이미지를 넣으려면, Boxdecoration의 image 속성과, DecorationImage 클래스를 사용해야 한다.
              image: AssetImage('assets/Feed_picture_01.png'),
            ),
          ),
        ),
        */

          /*
        body: Image.asset(
          'assets/Feed_picture_01.png',
          height: 150,
          width: 200,
          fit: BoxFit
              .fill, // 3. fit: Image 컨테이너 박스에, 내부 이미지를 어떻게 늘릴지(맞출지) 설정. BoxFit은 enum
        ), // 2. Image.asset() : Image 클래스를 한 번만 사용해서 이미지 불러오기
            /*
            Image.asset( ) 생성자 : 앱에 저장된 asset 파일로 이미지 출력
            Image.network( ) 생성자 : URL을 통해 이미지 출력
            Image.file( ) 생성자 : 플랫폼 단말기 내 이미지 파일로 출력
            Image.memory( ) 생성자 : 메모리에서 직접 이미지 출력
             */

        */
          /*
        const Image(
          /*
              1. Image 클래스의 image 속성에 들어가는 클래스들
                AssetImage( ) 클래스 : 앱에 저장된 asset 파일로 이미지 출력
                NetworkImage( ) 클래스 : URL을 통해 이미지 출력
                FileImage( ) 클래스 : 플랫폼 단말기 내 이미지 파일로 출력
                MemoryImage( ) 클래스 : 메모리에서 직접 이미지 출력
             */
          image: AssetImage(
              'assets/Feed_picture_01.png'), // 경로를 하드코딩으로 진행하기 때문에 에러가 많이 발생한다.

          
        ),
        */
          ),
    );
  }
}
