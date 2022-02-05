import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SiagaBalikpapan extends StatefulWidget {
  const SiagaBalikpapan({Key? key}) : super(key: key);

  @override
  _SiagaBalikpapanState createState() => _SiagaBalikpapanState();
}

class _SiagaBalikpapanState extends State<SiagaBalikpapan> {
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
                      'Siaga Balikpapan',
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
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            canLaunch('tel:0542414522').then((bool result) {
                              launch('tel:0542414522');
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFDD55).withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/icon/PMI.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Palang Merah Indonesia (PMI)',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            canLaunch('tel:110').then((bool result) {
                              launch('tel:110');
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFDD55).withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/icon/Polisi.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Polisi',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            canLaunch('tel:113').then((bool result) {
                              launch('tel:113');
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFDD55).withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                    'assets/icon/Pemadam kebakaran.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Pemadam Kebakaran',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            canLaunch('tel:118').then((bool result) {
                              launch('tel:118');
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFDD55).withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/icon/Ambulans.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Ambulans',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            canLaunch('tel:05427218831').then((bool result) {
                              launch('tel:05427218831');
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFDD55).withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/icon/PDAM.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'PDAM',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            canLaunch('tel:0274123').then((bool result) {
                              launch('tel:0274123');
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFDD55).withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/icon/PLN.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'PLN',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            canLaunch('tel:0542874092').then((bool result) {
                              launch('tel:0542874092');
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFDD55).withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    Image.asset('assets/icon/Dinas sosial.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Dinas Sosial',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            canLaunch('tel:082157105322').then((bool result) {
                              launch('tel:082157105322');
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFDD55).withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                    'assets/icon/satgas covid-19.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Satgas Covid-19',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
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
          ],
        ),
      ),
    );
  }
}
