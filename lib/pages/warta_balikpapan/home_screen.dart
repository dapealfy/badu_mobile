import 'package:badu/pages/warta_balikpapan/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

class WartaBalikpapan extends StatefulWidget {
  const WartaBalikpapan({Key? key}) : super(key: key);

  @override
  _WartaBalikpapanState createState() => _WartaBalikpapanState();
}

class _WartaBalikpapanState extends State<WartaBalikpapan> {
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
                      'Warta Balikpapan',
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
      ),
    );
  }
}
