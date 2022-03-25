import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:solar_system/data/data.dart';
import 'package:solar_system/pages/details_page.dart';

import '../utils/constants.dart';
import 'pages_widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizeIconsBottom = size.height * 0.04;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: linearGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleTop(size: size),
            const SizedBox(height: 10),
            Expanded(
              child: Swiper(
                  controller: SwiperController(),
                  layout: SwiperLayout.CUSTOM,
                  customLayoutOption:
                      CustomLayoutOption(startIndex: -2, stateCount: 3)
                          .addTranslate([
                    const Offset(0.0, 40),
                    const Offset(0.0, 0.0),
                    const Offset(0, -40.0),
                  ]).addScale([0.8, 0.9, 1], Alignment.center)
                        ..addOpacity([0.35, 0.5, 1]),
                  itemHeight: size.height * 0.55,
                  scrollDirection: Axis.vertical,
                  itemCount: planets.length,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Color(0xFF464C68),
                        activeColor: kColorRose,
                        activeSize: 15,
                        space: 8),
                  ),
                  itemBuilder: (context, int i) {
                    return GestureDetector(
                      child: PlanetPreview(size: size, i: i),
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            pageBuilder: (context, animation, _) {
                              return FadeTransition(
                                  opacity: Tween<double>(begin: 0.0, end: 1.0)
                                      .animate(CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeOut)),
                                  child: DetailsPage(
                                    i: i,
                                  ));
                            }));
                      },
                    );
                  }),
            ),
            HomePageBottomAppBar(size: size, sizeIconsBottom: sizeIconsBottom)
          ],
        ),
      ),
    ));
  }
}
