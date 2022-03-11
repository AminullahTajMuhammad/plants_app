import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/constants.dart';

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset("assets/ic_cart.svg"),
            ),
          ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 350,
          alignment: Alignment.center,
          child: Image.asset("assets/ic_plant_bg.png"),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            color: Color(0xffF3F3F3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, left: 25),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Text(
                      "Succulent Plant",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Positioned(
                      right: 1,
                      bottom: 1,
                      top: 1,
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 0),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            bottomLeft: Radius.circular(35),
                          ),
                          color: Constants.PRIMARY_COLOR,
                        ),
                        child: Text(
                          "\$39.99",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 25),
                child: Text(
                  "About",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 25, right: 20),
                child: Text(
                  "Succulent Plantis one of the most popular and beautiful species that will produce clumpms. The storage of water often gives succulent plants a more swollen or fleshy appearance than other plants, a characteristic known as succulence.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: const Icon(
                                    Icons.minimize_rounded,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Constants.PRIMARY_COLOR,
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 37,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 125,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Constants.PRIMARY_COLOR
                          ),
                          child: Text(
                            "Buy",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
