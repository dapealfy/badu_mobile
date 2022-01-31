import 'dart:convert';

import 'package:badu/pages/aduan_balikpapan/detail_incident.dart';
import 'package:badu/widgets/item_laporan.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabler_icons/tabler_icons.dart';
// import 'package:incidentmonitoring_user/settings/global_variable.dart'
//     as setting;
// import 'package:http/http.dart' as http;

class AduanBalikpapan extends StatefulWidget {
  const AduanBalikpapan({Key? key}) : super(key: key);

  @override
  _AduanBalikpapanState createState() => _AduanBalikpapanState();
}

class _AduanBalikpapanState extends State<AduanBalikpapan> {
  TextEditingController controllerSearch = TextEditingController();

  //............
  // Report
  //............
  // List report = [];
  // void _dataReport() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Uri url = Uri.parse(setting.url_api + "api/report");
  //   final response = await http.get(url, headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ' + prefs.getString('token').toString()
  //   });
  //   Map<String, dynamic> _report;

  //   _report = json.decode(response.body);
  //   setState(() {
  //     report = _report['reports'];
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _dataReport();
  // }

  var data = {
    "id": 3,
    "user_id": 3,
    "date": "2021-12-27",
    "status": "validasi",
    "category": null,
    "title": "Laporan A",
    "description": "Deskripsi Laporan A",
    "location": "Lokasi ABCDEFGHIJKLMN",
    "document":
        "https://awsimages.detik.net.id/community/media/visual/2022/01/21/sopir-truk-tronton-balikpapan-tersangka-ini-fakta-terbaru-kecelakaan-maut_169.png?w=700&q=90",
    "lat": 0,
    "lng": 0,
    "created_at": "2021-12-27T07:42:57.000000Z",
    "updated_at": "2021-12-27T07:42:57.000000Z",
    "user": {
      "id": 3,
      "role": "petugas",
      "name": "PETUGAS (Edit)",
      "phone_number": "085656565656",
      "email": "petugas@gmail.com",
      "avatar":
          "http://ims.weirdprojecttest.com/storage/avatar/sBgm8qZUTCrzhwn20DiwYDewXsNNEkqGZGatu7GC.jpg",
      "fcm_token": null,
      "lat": -1.2510130310316125,
      "lng": 116.88780136706316,
      "created_at": "2021-12-19T13:19:39.000000Z",
      "updated_at": "2022-01-01T10:04:57.000000Z"
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
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
                          'Aduan Balikpapan',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  // Search
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextField(
                      controller: controllerSearch,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(TablerIcons.search),
                          labelText: "Cari laporan"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                        ),
                        itemBuilder: (context, index) {
                          return ItemLaporan(
                              thumbnail:
                                  'https://awsimages.detik.net.id/community/media/visual/2022/01/21/sopir-truk-tronton-balikpapan-tersangka-ini-fakta-terbaru-kecelakaan-maut_169.png?w=700&q=90',
                              status: 'diproses',
                              nomor_laporan: 'IMS1927364',
                              title: 'Kecelakaan Mobil',
                              nama_user: 'Daffa Alvi',
                              tanggal_masuk: '30 Januari 2022',
                              data: data);
                        },
                      ),
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
