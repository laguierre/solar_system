import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solar_system/data/data.dart';
import 'package:solar_system/utils/constants.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.i,
  }) : super(key: key);
  final int i;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            TopAppBarDetails(size: size, i: i),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Divider(
                    thickness: 1.5,
                  ),
                  const SizedBox(height: 10),
                  RichText(
                      text: TextSpan(
                          text: planets[i].description,
                          style:
                              const TextStyle(color: kTextColor, fontSize: 18),
                          children: const [
                        TextSpan(
                            text: ' Read more',
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 18))
                      ])),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 1.5,
                  ),
                  const Text('Gallery',
                      style: TextStyle(color: kTextColor, fontSize: 25)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: size.height * 0.3,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: planets[i].images.length,
                  itemBuilder: (context, j) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            planets[i].images[j],
                            fit: BoxFit.cover,
                          )),
                    );
                  }),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    ));
  }
}

class TopAppBarDetails extends StatelessWidget {
  const TopAppBarDetails({
    Key? key,
    required this.size,
    required this.i,
  }) : super(key: key);

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 5,
            child: Text(
              planets[i].position.toString(),
              style: TextStyle(
                  fontSize: 210,
                  fontFamily: 'RobotoBold',
                  color: Colors.grey.withOpacity(0.5)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(planets[i].name,
                    style: const TextStyle(
                        fontSize: 45,
                        fontFamily: 'RobotoBold',
                        color: kTextColor)),
                const Text('Solar System',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'RobotoLight',
                        color: kTextColor)),
              ],
            ),
          ),
          Positioned(
              right: -100,
              top: -60,
              child: Hero(
                  tag: planets[i].iconImage,
                  child: Image.asset(planets[i].iconImage))),
          Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                  icon: const Icon(CupertinoIcons.back,
                      color: kTextColor, size: 28),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ],
      ),
    );
  }
}
