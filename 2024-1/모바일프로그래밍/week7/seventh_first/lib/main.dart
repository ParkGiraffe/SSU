import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            //status bar
            const SizedBox(
              height: 44,
            ),
            // top
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 6, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // logo
                  Image.asset("assets/Instagram_logo.png"),

                  // icons
                  Row(
                    children: [
                      Image.asset(
                        "assets/Add.png",
                        width: 26,
                        height: 26,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Image.asset(
                        "assets/Heart.png",
                        width: 26,
                        height: 26,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Image.asset(
                        "assets/Share.png",
                        width: 26,
                        height: 26,
                      ),
                    ],
                  )
                ],
              ),
            ),
            // body
            Expanded(
              child: Column(
                children: [
                  //userList
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    height: 108,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // user
                          User(
                            userName: 'flutter_framework',
                            profilePicture: 'assets/Profile_picture_02.png',
                          ),
                          User(
                            userName: 'awesome_application',
                            profilePicture: 'assets/Profile_picture_06.png',
                          ),
                          User(
                            userName: 'flutter_framework',
                            profilePicture: 'assets/Profile_picture_02.png',
                          ),
                          User(
                            userName: 'awesome_application',
                            profilePicture: 'assets/Profile_picture_06.png',
                          ),
                          User(
                            userName: 'flutter_framework',
                            profilePicture: 'assets/Profile_picture_02.png',
                          ),
                          User(
                            userName: 'awesome_application',
                            profilePicture: 'assets/Profile_picture_06.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // bottom
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/Home.png",
                  ),
                  Image.asset(
                    "assets/Search.png",
                  ),
                  Image.asset(
                    "assets/Reels.png",
                  ),
                  Image.asset(
                    "assets/Shop.png",
                  ),
                  Image.asset(
                    "assets/Profile_picture_01.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@override
class User extends StatelessWidget {
  final String userName;
  final String profilePicture;

  const User({super.key, required this.userName, required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            width: 71,
            height: 71,
            padding: const EdgeInsets.all(2.5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft, // 그라디언트 시작지점
                end: Alignment.topRight, // 그라디언트 종료점
                stops: [0.2, 0.4, 0.6, 0.8, 1], // 그라디언트 중지점
                colors: [
                  Color(0xFFFFD600),
                  Color(0xFFFF7A00),
                  Color(0xFFFF0069),
                  Color(0xFFD300C5),
                  Color(0xFF7638FA),
                ], // 중지점에서의 컬러
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2.5),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(profilePicture),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 71,
            child: Text(
              userName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
