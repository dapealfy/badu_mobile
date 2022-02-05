import 'dart:convert';

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
import 'package:badu/settings/global_variable.dart' as setting;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// ............
  // Warba
  // ............
  List warba = [];
  void _dataWarba() async {
    Uri url = Uri.parse("https://www.instagram.com/pemkot_balikpapan/?__a=1");
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
    });
    Map<String, dynamic> _warba;

    _warba = json.decode(response.body);
    setState(() {
      warba =
          _warba['graphql']['user']['edge_owner_to_timeline_media']['edges'];
    });
  }

  @override
  void initState() {
    super.initState();
    _dataWarba();
  }

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
                    itemCount: warba.length == 0 ? 0 : 8,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailWartaBalikpapan(
                                image: warba[index]['node']['display_url'],
                                description: warba[index]['node']
                                        ['edge_media_to_caption']['edges'][0]
                                    ['node']['text'],
                              ),
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                        warba[index]['node']['display_url'])),
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
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                              'https://scontent-cgk1-1.cdninstagram.com/v/t51.2885-19/s150x150/257717259_2708907252737830_4304582086925372761_n.jpg?_nc_ht=scontent-cgk1-1.cdninstagram.com&_nc_cat=110&_nc_ohc=PrPUp4h8xsIAX8awJEh&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT-WnQIQM2uUGYNEipwj5mfXiHl-c60fuur8pK1Q-8AGVg&oe=62060492&_nc_sid=7bff83')),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Pemkot Balikpapan'),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  warba[index]['node']['edge_media_to_caption']
                                      ['edges'][0]['node']['text'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
