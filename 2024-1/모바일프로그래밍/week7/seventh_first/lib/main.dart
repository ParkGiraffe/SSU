import 'package:flutter/material.dart';

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
              child: Column(),
            ),
            // bottom
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
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
