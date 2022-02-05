import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:badu/settings/global_variable.dart' as setting;
import 'package:http/http.dart' as http;

class FasilitasBalikpapan extends StatefulWidget {
  const FasilitasBalikpapan({Key? key}) : super(key: key);

  @override
  _FasilitasBalikpapanState createState() => _FasilitasBalikpapanState();
}

class _FasilitasBalikpapanState extends State<FasilitasBalikpapan> {
  // ............
  // Report
  // ............
  List report = [];
  void _dataReport() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(setting.url_api + "api/facilities");
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + prefs.getString('token').toString()
    });
    Map<String, dynamic> _report;

    _report = json.decode(response.body);
    setState(() {
      report = _report['facility'];
    });
  }

  @override
  void initState() {
    super.initState();
    _dataReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Fasilitas Balikpapan',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fasilitas Kesehatan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFDCCB3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                      'assets/icon/rumah sakit.png'),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Rumah\nSakit',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFDCCB3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                      Image.asset('assets/icon/puskesmas.png'),
                                ),
                                SizedBox(height: 7),
                                Text('Puskesmas')
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFDCCB3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset('assets/icon/klinik.png'),
                                ),
                                SizedBox(height: 7),
                                Text('Klinik')
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Fasilitas Transportasi',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xff88BBFF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                      'assets/icon/terminal bus.png'),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Terminal\nBus',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xff88BBFF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset('assets/icon/bandara.png'),
                                ),
                                SizedBox(height: 7),
                                Text('Bandara')
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xff88BBFF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                      Image.asset('assets/icon/pelabuhan.png'),
                                ),
                                SizedBox(height: 7),
                                Text('Pelabuhan')
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Fasilitas Luar Ruangan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xff70BB80),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset('assets/icon/RTH.png'),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Taman\n& RTH',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xff70BB80),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                      'assets/icon/sarana olahraga.png'),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Sarana\nOlahraga',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
