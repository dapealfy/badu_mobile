import 'dart:convert';

import 'package:badu/settings/string.dart';
import 'package:badu/widgets/item_laporan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:badu/settings/global_variable.dart' as setting;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  // ............
  // Report
  // ............
  List report = [];
  void _dataReport() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(setting.url_api + "api/activity");
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
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Aktivitas',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: report.length == 0
                  ? Center(
                      child: Text('Tidak ada Aktivitas'),
                    )
                  : ListView.builder(
                      reverse: true,
                      itemCount: report.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var _waktu =
                            replaceCharAt(report[index]['created_at'], 10, " ");
                        var waktu =
                            DateTime.parse(replaceCharAt(_waktu, 26, ""))
                                .add(Duration(hours: 8));
                        var waktu_pemesanan =
                            DateFormat('d MMM yyyy, HH:mm').format(waktu);
                        return Container(
                          height: 285,
                          child: ItemLaporan(
                              thumbnail: report[index]['image'],
                              status: report[index]['status'],
                              nomor_laporan:
                                  'IMS' + report[index]['id'].toString(),
                              title: report[index]['title'],
                              nama_user: 'Daffa Alvi Reri',
                              tanggal_masuk: waktu_pemesanan,
                              data: report[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
