import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'item_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Constants.PRIMARY_COLOR,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/ic_home.svg"),
            label: ""
          ),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/ic_favourite.svg"), label: ""),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/ic_notification.svg"), label: ""),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/ic_profile.svg"), label: ""),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: initWidget(),
        ),
      ),
    );
  }

  Widget initWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildGreetings(),
        buildSearch(),
        buildPlantsList()
      ],
    );
  }

  Widget buildGreetings() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontSize: 23,
                  ),
                ),
                Text(
                  'Plant Shop',
                  style: TextStyle(
                    color: Constants.PRIMARY_COLOR,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 25,
            top: 25,
            child: Container(
              child: SvgPicture.asset('assets/ic_cart.svg'),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 55,
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color(0xffE8E8E8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, right: 10),
                      child: Text(
                        'Search for items here',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Constants.PRIMARY_COLOR,
              ),
              child: SvgPicture.asset(
                "assets/ic_filter.svg",
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPlantsList() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 10, bottom: 20),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        children: [
          plantsListTile("assets/plant_1.png", "Succulent Plant", "\$39.99", true, true),
          plantsListTile("assets/plant_2.png", "Dragon Plant", "\$29.99", false, false),
          plantsListTile("assets/plant_3.png", "Ravenea Plant", "\$19.99", false, true),
          plantsListTile("assets/plant_4.png", "Potted Plant", "\$49.99", true, false),
          plantsListTile("assets/plant_5.png", "Ravenea Plant 2", "\$9.99", false, false),
          plantsListTile("assets/plant_6.png", "Succulent Plant 2", "\$39.99", true, true),
        ],
      )
    );
  }

  Widget plantsListTile(String img, String name, String price, bool isFavourite, bool addToCart) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailsPage()));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20, top: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xffE8E8E8),
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    child: Image.asset(img),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      price,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Like Button
            Positioned(
              right: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  isFavourite ? "assets/ic_like_selected.svg" : "assets/ic_like_unselected.svg",
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                height: 20,
                width: 20,
                margin: const EdgeInsets.only(right: 10, bottom: 14),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  color: addToCart ? Constants.PRIMARY_COLOR : Colors.grey,
                ),
                child: const Icon(
                  Icons.add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            )
            // Cart Button
          ],
        ),
      ),
    );
  }
}
