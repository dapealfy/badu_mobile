import 'dart:convert';

import 'package:badu/pages/warta_balikpapan/detail_screen.dart';
import 'package:badu/settings/color.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:badu/settings/global_variable.dart' as setting;
import 'package:http/http.dart' as http;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
// ............
  // Warba
  // ............
  List warba = [];
  late Map<String, dynamic> _warba;
  void _dataWarba() async {
    Uri url = Uri.parse("https://www.instagram.com/covid19_bpn/?__a=1");
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
    });

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
                      'Notifikasi',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: warba.length == 0
                  ? Center(
                      child: Container(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(color: primaryColor),
                      ),
                    )
                  : ListView.builder(
                      itemCount: warba.length,
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
                                                _warba['graphql']['user']
                                                    ['profile_pic_url'])),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(_warba['graphql']['user']
                                          ['full_name']),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    warba[index]['node']
                                            ['edge_media_to_caption']['edges']
                                        [0]['node']['text'],
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
            ),
          ],
        ),
      ),
    );
  }
}
