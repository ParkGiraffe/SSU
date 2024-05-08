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
            const Top(),

            // body
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //user list
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

                    // feeds
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // user info
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 52,
                          child: Row(
                            children: [
                              Image.asset('assets/Profile_picture_02.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'flutter_framework',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.more_horiz,
                              ),
                            ],
                          ),
                        ),

                        // feed pictures
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Feed_picture_01.png',
                                width: MediaQuery.of(context)
                                    .size
                                    .width, // context는 최상위 부모 위젯에서 생성되는데, 모바일 화면의 온갖 정보를 담고 있는 객체이다.
                              ),
                              Image.asset(
                                'assets/Feed_picture_02.png',
                                width: MediaQuery.of(context).size.width,
                              ),
                              Image.asset(
                                'assets/Feed_picture_03.png',
                                width: MediaQuery.of(context).size.width,
                              ),
                            ],
                          ),
                        ),

                        // actions
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          height: 42,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Heart.png',
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/Comment.png',
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/Share.png',
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/Bookmark.png',
                              ),
                            ],
                          ),
                        ),

                        // Details
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: 'awesome application',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(text: '님 외'),
                                    TextSpan(
                                      text: '10명',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: '이 좋아합니다.'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text.rich(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                TextSpan(
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: 'flutter_framework',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                        text:
                                            'Ipsum Lorem is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '댓글 102개 모두 보기',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '1일 전',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // bottom
            const Bottom()
          ],
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    final bool isFirst =
        context.findAncestorWidgetOfExactType<Row>()?.children[0] ==
            this; // 내 부모인 row에서 자식들이 있는데, 그 중 첫 번째가 바로 나인가?

    const instaGradient = LinearGradient(
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
    );

    Widget addBadge = Positioned(
      right: 2,
      bottom: 2,
      child: Container(
        width: 21,
        height: 21,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2.5,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 13,
          weight: 100,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 71,
                height: 71,
                padding: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isFirst ? null : instaGradient,
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
                  isFirst ? '내 스토리' : userName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          isFirst ? addBadge : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
