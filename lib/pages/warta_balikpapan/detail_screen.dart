import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

class DetailWartaBalikpapan extends StatefulWidget {
  const DetailWartaBalikpapan({Key? key}) : super(key: key);

  @override
  _DetailWartaBalikpapanState createState() => _DetailWartaBalikpapanState();
}

class _DetailWartaBalikpapanState extends State<DetailWartaBalikpapan> {
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.7),
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
                              'Macet parah di sekitaran daerah simpang 3 kariangau (depan hotel platinum) hingga simpang 3 pasar butun. Macet parah di sekitaran daerah simpang 3 kariangau (depan hotel platinum) hingga simpang 3 pasar butun. Macet parah di sekitaran daerah simpang 3 kariangau (depan hotel platinum) hingga simpang 3 pasar butun. Macet parah di sekitaran daerah simpang 3 kariangau (depan hotel platinum) hingga simpang 3 pasar butun. '),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
