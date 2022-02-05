import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

class DetailWartaBalikpapan extends StatefulWidget {
  final image;
  final description;
  const DetailWartaBalikpapan({Key? key, this.image, this.description})
      : super(key: key);

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
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(widget.image)),
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
                                    borderRadius: BorderRadius.circular(100),
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
                          child: Text(widget.description),
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
