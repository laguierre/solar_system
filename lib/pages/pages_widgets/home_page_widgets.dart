import 'package:flutter/material.dart';
import 'package:solar_system/data/data.dart';
import 'package:solar_system/utils/constants.dart';

class TitleTop extends StatelessWidget {
  const TitleTop({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(top: 50, left: kPadding),
        height: size.height * 0.12,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Explore',
                style: TextStyle(
                    fontFamily: 'RobotoBold',
                    letterSpacing: 1.1,
                    color: Colors.white,
                    fontSize: size.height * 0.05)),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Solar System',
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 10),
                Image.asset('lib/assets/icons/drop_down_icon.png', scale: 0.85)
              ],
            )
          ],
        ));
  }
}

class HomePageBottomAppBar extends StatelessWidget {
  const HomePageBottomAppBar({
    Key? key,
    required this.size,
    required this.sizeIconsBottom,
  }) : super(key: key);

  final Size size;
  final double sizeIconsBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: size.height * 0.1,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Color(0xFF6354AE),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: Image.asset('lib/assets/icons/menu_icon.png'),
              label: Row(
                children: const [
                  SizedBox(width: 7),
                  Text("Explore",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              )),
          const SizedBox(width: 40),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search,
                  size: sizeIconsBottom, color: Colors.grey)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline,
                  size: sizeIconsBottom, color: Colors.grey)),
        ],
      ),
    );
  }
}

class PlanetPreview extends StatelessWidget {
  const PlanetPreview({
    Key? key,
    required this.size,
    required this.i,
  }) : super(key: key);

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          bottom: 5,
          child: Container(
            height: size.height * 0.4,
            width: size.width * 0.75,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.grey.shade400,
                    ]),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(30))),
          ),
        ),
        Positioned(
            left: size.width * 0.47,
            bottom: -40,
            child: Text(
              planets[i].position.toString(),
              style: TextStyle(
                  fontSize: 230,
                  fontFamily: 'RobotoBold',
                  color: Colors.grey.withOpacity(0.5)),
            )),
        Positioned(
          left: 80,
          bottom: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(planets[i].name,
                  style: TextStyle(
                      fontFamily: 'RobotoBold',
                      letterSpacing: 1.1,
                      color: kTextColor,
                      fontSize: size.height * 0.06)),
              Text('Solar System',
                  style: TextStyle(
                      color: kTextColor ,
                      fontSize: size.height * 0.03)),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Text('Know more',
                      style: TextStyle(color: kColorRose, fontSize: 20)),
                  SizedBox(width: 7),
                  Icon(Icons.arrow_right_alt, color: kColorRose, size: 30)
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 30,
          top: 0,
          child: SizedBox(
            height: size.height * 0.41,
            child: Hero(
              tag: planets[i].iconImage,
              child: Image.asset(
                planets[i].iconImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

