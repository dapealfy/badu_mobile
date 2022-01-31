import 'package:badu/pages/aduan_balikpapan/home_screen.dart';
import 'package:badu/pages/fasilitas_balikpapan/home_screen.dart';
import 'package:badu/pages/pantau_balikpapan/home_screen.dart';
import 'package:badu/pages/siaga_balikpapan/home_screen.dart';
import 'package:badu/pages/warta_balikpapan/detail_screen.dart';
import 'package:badu/pages/warta_balikpapan/home_screen.dart';
import 'package:badu/pages/wifi_balikpapan/home_screen.dart';
import 'package:badu/settings/color.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'ba',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'du',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: secondaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.help_outline_sharp,
                        size: 30, color: Colors.black.withOpacity(0.8)))
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/carousel.png'),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffD4E7FC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Scan PeduliLindungi kamu di sini!',
                            style: TextStyle(
                              color: Color(0xff0070F0),
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            )),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xff0070F0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Scan',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(TablerIcons.qrcode, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      Text('Bersama dengan '),
                      Text(
                        'PeduliLindungi',
                        style: TextStyle(
                          color: Color(0xff0070F0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AduanBalikpapan(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset('assets/icon/AduBa.png'),
                                ),
                                SizedBox(height: 7),
                                Text('AduBa',
                                    style: TextStyle(
                                        color: Color(0xff666666),
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WartaBalikpapan(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset('assets/icon/WarBa.png'),
                                ),
                                SizedBox(height: 7),
                                Text('WarBa',
                                    style: TextStyle(
                                        color: Color(0xff666666),
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WifiBalikpapan(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset('assets/icon/WifiBa.png'),
                                ),
                              ),
                              SizedBox(height: 7),
                              Text('WifiBa',
                                  style: TextStyle(
                                      color: Color(0xff666666), fontSize: 14)),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PantauBalikpapan(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child:
                                      Image.asset('assets/icon/PantauAn.png'),
                                ),
                                SizedBox(height: 7),
                                Text('PantauAn',
                                    style: TextStyle(
                                        color: Color(0xff666666),
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SiagaBalikpapan(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset('assets/icon/SigBa.png'),
                                ),
                                SizedBox(height: 7),
                                Text('SigBa',
                                    style: TextStyle(
                                        color: Color(0xff666666),
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FasilitasBalikpapan(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: Image.asset('assets/icon/FasBa.png'),
                                ),
                                SizedBox(height: 7),
                                Text('FasBa',
                                    style: TextStyle(
                                        color: Color(0xff666666),
                                        fontSize: 14)),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        0.0,
                                        0.0,
                                      ),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 70,
                                width: 70,
                                child: Image.asset('assets/icon/BaPenda.png'),
                              ),
                              SizedBox(height: 7),
                              Text('BaPenda',
                                  style: TextStyle(
                                      color: Color(0xff666666), fontSize: 14)),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        0.0,
                                        0.0,
                                      ),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 70,
                                width: 70,
                                child: Image.asset('assets/icon/BaLayan.png'),
                              ),
                              SizedBox(height: 7),
                              Text('BaLayan',
                                  style: TextStyle(
                                      color: Color(0xff666666), fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  color: Color(0xffE5E5E5).withOpacity(0.7),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kabar Terbaru dari Kota Balikpapan',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      SizedBox(height: 10),
                      Text(
                          'Berbagai kabar terbaru Kota Balikpapan yang perlu kamu ketahui')
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailWartaBalikpapan(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.withOpacity(0.7),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Balikpapanku'),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                    'Macet parah di sekitaran daerah simpang 3 kariangau (depan hotel platinum) hingga simpang 3 pasar butun.'),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
