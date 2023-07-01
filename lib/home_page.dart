import 'package:anime_web/appbar.dart';
import 'package:anime_web/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _currentRotation = 0.0;
  List<String> shoeImages = [
    'image1.png',
    'image2.png',
    'image3.png',
    'image4.png',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isWeb = MediaQuery.of(context).size.width > 600;
    return Scaffold(
        backgroundColor: const Color(0xff512484),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(isWeb ? 12.h(context) : 8.h(context)),
          child: const ResponsiveAppBar(),
        ),
        body: isWeb
            ? Stack(children: [
                Positioned(
                    top: 20,
                    right: 600,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffb1a7bc),
                      ),
                    )),
                buildWebView(context),
                Positioned(
                    bottom: 20,
                    left: 600,
                    child: Container(
                      height: 180,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffb1a7bc),
                      ),
                    )),
              ])
            : Stack(children: [
                Positioned(
                    top: 20,
                    right: 600,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffb1a7bc),
                      ),
                    )),
                buildMobileView(context),
                Positioned(
                    bottom: 10,
                    left: 70,
                    child: Container(
                      height: 150,
                      width: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffb1a7bc),
                      ),
                    )),
              ]));
  }

  Row buildWebView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SPORTS SHOES",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "MEN'S COLLECTION",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "Find your true style with shoexpress\n and explore the variety of playful,\n colourful designs!",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 3.h(context),
            ),
            Container(
              height: 5.h(context),
              width: 10.w(context),
              decoration: BoxDecoration(
                  color: const Color(0xff6f3eb2),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Center(child: Icon(Icons.play_arrow))),
                  SizedBox(
                    width: 1.w(context),
                  ),
                  const Text(
                    "Shop Now",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                _currentRotation = _animationController.value * 2.0 * math.pi;
                return Center(
                  child: SizedBox(
                    height: 90.h(context),
                    width: 70.w(context),
                    child: Stack(
                      children: [
                        for (int i = 0; i < shoeImages.length; i++)
                          _buildShoeImage(i),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: 42.h(context),
              right: -15.w(context),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                height: 40.h(context),
                width: 30.w(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShoeImage(int index) {
    final double rotation =
        _currentRotation + (index * 2.0 * math.pi / shoeImages.length);
    final double radius = 60.h(context);

    final double x = math.cos(rotation) * radius;
    final double y = math.sin(rotation) * radius;

    return Positioned(
      left: x + MediaQuery.of(context).size.width / 2 - 50.0,
      top: y + MediaQuery.of(context).size.height / 2 - 50.0,
      child: Transform.rotate(
        angle: 7.5,
        child: Image.asset('assets/images/${shoeImages[index]}',
            width: 40.w(context), height: 70.h(context), fit: BoxFit.contain),
      ),
    );
  }

  //mobile view

  buildMobileView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h(context),
          ),
          const Text(
            "SPORTS SHOES",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Text(
            "MEN'S COLLECTION",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Text(
            "Find your true style with shoexpress\n and explore the variety of playful,\n colourful designs!",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(
            height: 3.h(context),
          ),
          Container(
            height: 5.h(context),
            width: 40.w(context),
            decoration: BoxDecoration(
                color: const Color(0xff6f3eb2),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Center(child: Icon(Icons.play_arrow))),
                SizedBox(
                  width: 2.w(context),
                ),
                const Text(
                  "Shop Now",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),

          //////////////////////////////
          Expanded(
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    _currentRotation =
                        _animationController.value * 2.0 * math.pi;
                    return Center(
                      child: SizedBox(
                        height: 70.h(context),
                        width: 100.w(context),
                        child: Stack(
                          children: [
                            for (int i = 0; i < shoeImages.length; i++)
                              _buildmobileImage(i),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Flexible(
                  child: Positioned(
                    top: 5.h(context),
                    right: -15.w(context),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      height: 50.h(context),
                      width: 30.w(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildmobileImage(int index) {
    final double rotation =
        _currentRotation + (index * 2.0 * math.pi / shoeImages.length);
    final double radius = 140.0;

    final double x = math.cos(rotation) * radius;
    final double y = math.sin(rotation) * radius;

    return Positioned(
      left: x + MediaQuery.of(context).size.width / 1 - 190.0,
      top: y + MediaQuery.of(context).size.height / 3 - 190.0,
      child: Transform.rotate(
        angle: 7.5,
        child: Image.asset('assets/images/${shoeImages[index]}',
            width: 40.w(context), height: 30.h(context), fit: BoxFit.contain),
      ),
    );
  }
}
