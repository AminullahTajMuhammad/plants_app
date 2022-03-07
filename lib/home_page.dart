import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

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
        buildGreetings()
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
}
