import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CustomPageController controller = CustomPageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Column(children: [
                        Text(
                          'What is your goal ?',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF1D1617)),
                        ),
                        Text(
                          'It will help us to choose a best\nprogram for you',
                          style:
                              TextStyle(fontSize: 12, color: Color(0XFF7B6F72)),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ),
                    Expanded(flex: 4, child: buildCardCarousel()),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF9DCEFF), Color(0xFF92A3FD)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 4), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(99),
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SignUp()));
                          },
                          child: const SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Confirm",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget buildCardCarousel() {
    final List<Widget> cards = [
      const CustomCard(
        gradientColors: [Color(0XFF92A3FD), Color(0xff9DCEFF)],
        title: 'Improve Shape',
        description:
            'I have a low amount of body fat\nand need / want to build more\nmuscle',
        imageUrl: 'assets/images/onboard_1.svg',
      ),
      const CustomCard(
        gradientColors: [Color(0XFF92A3FD), Color(0xff9DCEFF)],
        title: 'Lean & Tone',
        description:
            'I’m “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way',
        imageUrl: 'assets/images/onboard_2.svg',
      ),
      const CustomCard(
        gradientColors: [Color(0XFF92A3FD), Color(0xff9DCEFF)],
        title: 'Loose a Fat',
        description:
            'I have over 20 lbs to lose.\nI want to drop all this fat and gain muscle\nmass',
        imageUrl: 'assets/images/onboard_3.svg',
      ),
    ];

    return PageView.builder(
      controller: controller,
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        final double currentPage = controller.page ?? 0.0;
        final double scaleFactor = 1.0 - (0.1 * ((currentPage - index).abs()));
        return Transform.scale(
          scale: scaleFactor,
          child: cards[index],
        );
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  final List<Color> gradientColors;
  final String title;
  final String description;
  final String imageUrl;

  const CustomCard({
    Key? key,
    required this.gradientColors,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Card(
          elevation: 8.0,
          shadowColor: const Color(0xFFE8CEE5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: SvgPicture.asset(imageUrl)),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: 80,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPageController extends PageController {
  CustomPageController({
    this.viewportFraction = 0.8,
    initialPage = 0,
  }) : super(
          initialPage: initialPage,
          viewportFraction: viewportFraction,
        );

  final double viewportFraction;

  @override
  double getPagePosition(int page) {
    final double pagePosition = getPagePosition(page.toDouble() as int);
    return pagePosition.clamp(-viewportFraction, viewportFraction);
  }
}
