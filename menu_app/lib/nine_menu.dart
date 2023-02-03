import 'package:flutter/material.dart';
import 'constants.dart' as constants;
import 'main.dart' as main_page;

class NineMenu extends StatefulWidget {
  const NineMenu({super.key});

  @override
  State<NineMenu> createState() => _NineMenuState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _NineMenuState extends State<NineMenu> with TickerProviderStateMixin {
  late TabController _tabController;
  late Future futureBreakfast;
  late Future futureLunch;
  late Future futureDinner;
  late Future futureLateNight;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    futureBreakfast = main_page.fetchAlbum('Nine', 'Breakfast');
    futureLunch = main_page.fetchAlbum('Nine', 'Lunch');
    futureDinner = main_page.fetchAlbum('Nine', 'Dinner');
    futureLateNight = main_page.fetchAlbum('Nine', 'Late%20Night');
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "9/10",
          style: TextStyle(
              fontSize: constants.menuHeadingSize,
              fontFamily: 'Monoton',
              color: Color(constants.yellowGold)),
        ),
        toolbarHeight: 60,
        centerTitle: false,
        backgroundColor: const Color(constants.darkBlue),
        shape: const Border(bottom: BorderSide(color: Colors.orange, width: 4)),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.orange, size: constants.backArrowSize),
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.orange,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 6, color: Colors.orange),
            ),
          ),
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.egg_alt_outlined),
            ),
            Tab(
              icon: Icon(Icons.fastfood_outlined),
            ),
            Tab(
              icon: Icon(Icons.dinner_dining_outlined),
            ),
            Tab(
              icon: Icon(Icons.access_time),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            //padding: const EdgeInsets.only(top: 20, left: 12),
            child: FutureBuilder(
              future: futureBreakfast,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    //padding: const EdgeInsets.all(4),
                    children: [
                      for (var i = 0; i < snapshot.data.length; i++)
                        if (i % 2 == 0)
                          (Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: constants.borderWidth,
                                          color: Color(constants.darkGray)))),
                              padding: const EdgeInsets.all(
                                  constants.containerPaddingTitle),
                              alignment: Alignment.topLeft,
                              child: Text(
                                snapshot.data[i],
                                style: const TextStyle(
                                  fontFamily: constants.titleFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: constants.titleFontSize,
                                  color: Color(constants.titleColor),
                                  height: constants.titleFontheight,
                                ),
                              )))
                        else
                          (Container(
                              padding: const EdgeInsets.all(
                                  constants.containerPaddingbody),
                              alignment: Alignment.topRight,
                              child: Text(
                                snapshot.data[i],
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontFamily: constants.bodyFont,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: constants.bodyFontSize,
                                  color: Color(constants.bodyColor),
                                  height: constants.bodyFontheight,
                                ),
                              )))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color(constants.yellowGold),
                    ),
                  );
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            //padding: const EdgeInsets.only(top: 20, left: 12),
            child: FutureBuilder(
              future: futureLunch,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    //padding: const EdgeInsets.all(4),
                    children: [
                      for (var i = 0; i < snapshot.data.length; i++)
                        if (i % 2 == 0)
                          (Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: constants.borderWidth,
                                          color: Color(constants.darkGray)))),
                              padding: const EdgeInsets.all(
                                  constants.containerPaddingTitle),
                              alignment: Alignment.topLeft,
                              child: Text(
                                snapshot.data[i],
                                style: const TextStyle(
                                  fontFamily: constants.titleFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: constants.titleFontSize,
                                  color: Color(constants.titleColor),
                                  height: constants.titleFontheight,
                                ),
                              )))
                        else
                          (Container(
                              padding: const EdgeInsets.all(
                                  constants.containerPaddingbody),
                              alignment: Alignment.topRight,
                              child: Text(
                                snapshot.data[i],
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontFamily: constants.bodyFont,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: constants.bodyFontSize,
                                  color: Color(constants.bodyColor),
                                  height: constants.bodyFontheight,
                                ),
                              )))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color(constants.yellowGold),
                    ),
                  );
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            //padding: const EdgeInsets.only(top: 20, left: 12),
            child: FutureBuilder(
              future: futureDinner,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    //padding: const EdgeInsets.all(4),
                    children: [
                      for (var i = 0; i < snapshot.data.length; i++)
                        if (i % 2 == 0)
                          (Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: constants.borderWidth,
                                          color: Color(constants.darkGray)))),
                              padding: const EdgeInsets.all(
                                  constants.containerPaddingTitle),
                              alignment: Alignment.topLeft,
                              child: Text(
                                snapshot.data[i],
                                style: const TextStyle(
                                  fontFamily: constants.titleFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: constants.titleFontSize,
                                  color: Color(constants.titleColor),
                                  height: constants.titleFontheight,
                                ),
                              )))
                        else
                          (Container(
                              padding: const EdgeInsets.all(
                                  constants.containerPaddingbody),
                              alignment: Alignment.topRight,
                              child: Text(
                                snapshot.data[i],
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontFamily: constants.bodyFont,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: constants.bodyFontSize,
                                  color: Color(constants.bodyColor),
                                  height: constants.bodyFontheight,
                                ),
                              )))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color(constants.yellowGold),
                    ),
                  );
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            //padding: const EdgeInsets.only(top: 20, left: 12),
            child: FutureBuilder(
              future: futureLateNight,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    //padding: const EdgeInsets.all(4),
                    children: [
                      for (var i = 0; i < snapshot.data.length; i++)
                        if (i % 2 == 0)
                          (Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: constants.borderWidth,
                                          color: Color(constants.darkGray)))),
                              padding: const EdgeInsets.all(
                                  constants.containerPaddingTitle),
                              alignment: Alignment.topLeft,
                              child: Text(
                                snapshot.data[i],
                                style: const TextStyle(
                                  fontFamily: constants.titleFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: constants.titleFontSize,
                                  color: Color(constants.titleColor),
                                  height: constants.titleFontheight,
                                ),
                              )))
                        else
                          (Container(
                              padding: const EdgeInsets.all(
                                  constants.containerPaddingbody),
                              alignment: Alignment.topRight,
                              child: Text(
                                snapshot.data[i],
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontFamily: constants.bodyFont,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: constants.bodyFontSize,
                                  color: Color(constants.bodyColor),
                                  height: constants.bodyFontheight,
                                ),
                              )))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color(constants.yellowGold),
                    ),
                  );
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}