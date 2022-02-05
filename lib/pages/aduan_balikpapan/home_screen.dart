import 'dart:convert';

import 'package:badu/pages/aduan_balikpapan/detail_incident.dart';
import 'package:badu/settings/string.dart';
import 'package:badu/widgets/item_laporan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:badu/settings/global_variable.dart' as setting;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AduanBalikpapan extends StatefulWidget {
  const AduanBalikpapan({Key? key}) : super(key: key);

  @override
  _AduanBalikpapanState createState() => _AduanBalikpapanState();
}

class _AduanBalikpapanState extends State<AduanBalikpapan> {
  TextEditingController controllerSearch = TextEditingController();

  // ............
  // Report
  // ............
  List report = [];
  void _dataReport() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(setting.url_api + "api/complaints");
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + prefs.getString('token').toString()
    });
    Map<String, dynamic> _report;

    _report = json.decode(response.body);
    setState(() {
      report = _report['complaint'];
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
                        itemCount: report.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                        ),
                        itemBuilder: (context, index) {
                          var _waktu = replaceCharAt(
                              report[index]['created_at'], 10, " ");
                          var waktu =
                              DateTime.parse(replaceCharAt(_waktu, 26, ""))
                                  .add(Duration(hours: 8));
                          var waktu_pemesanan =
                              DateFormat('d MMM yyyy, HH:mm').format(waktu);
                          return ItemLaporan(
                              thumbnail: report[index]['image'],
                              status: report[index]['status'],
                              nomor_laporan:
                                  'IMS' + report[index]['id'].toString(),
                              title: report[index]['title'],
                              nama_user: report[index]['user']['fullname'],
                              tanggal_masuk: waktu_pemesanan,
                              data: report[index]);
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
