import 'package:flutter/material.dart';
import 'package:simple_whetherapp/whether_class.dart';
import 'package:simple_whetherapp/whether_model.dart';
import 'package:google_fonts/google_fonts.dart';

class WhetherApp extends StatefulWidget {
  const WhetherApp({Key? key}) : super(key: key);

  @override
  State<WhetherApp> createState() => _WhetherAppState();
}

class _WhetherAppState extends State<WhetherApp> {
  WhetherData service = new WhetherData();
  Whether w = new Whether();

  String c_whether = '';
  double temp = 0;
  double farh = 0;
  String img = '';
  String location = '';
  String country = '';

  void getWhether() async {
    w = await service.getWhetherData("London");
    print(w.temperature_c);
    print(w.temperature_f);
    print(w.condition);
    print(w.img);

    setState(() {
      temp = w.temperature_c;
      farh = w.temperature_f;
      c_whether = w.condition;
      img = w.img;
      location = w.loc;
      country = w.place;
    });
  }

  @override
  void initState() {
    super.initState();
    getWhether();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://c0.wallpaperflare.com/preview/30/294/475/white-clouds.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("London",
                style:GoogleFonts.patuaOne(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                  letterSpacing: 2,
              ),
              ),
              Text(country,
                style:GoogleFonts.patuaOne(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Spacer(),
              Image.network("http:${img.toString()}"),
              Text(c_whether,
                style:GoogleFonts.patuaOne(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/1684/1684426.png')),
                        ),
                      ),
                      Text(
                        temp.toString(),
                        style:GoogleFonts.patuaOne(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/5753/5753191.png',
                            ),
                          ),
                        ),
                      ),
                      Text(farh.toString(),
                        style:GoogleFonts.patuaOne(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
