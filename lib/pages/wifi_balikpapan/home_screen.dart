import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tabler_icons/tabler_icons.dart';

class WifiBalikpapan extends StatefulWidget {
  const WifiBalikpapan({Key? key}) : super(key: key);

  @override
  _WifiBalikpapanState createState() => _WifiBalikpapanState();
}

class _WifiBalikpapanState extends State<WifiBalikpapan> {
  late GoogleMapController _controller;
  static LatLng _kMapCenter = const LatLng(0, 0);

  static CameraPosition _kInitialPosition = CameraPosition(target: _kMapCenter);

  final List<Marker> _markers = <Marker>[];

  updateLocationMap() {
    setState(() {
      _kMapCenter = LatLng(-1.246131, 116.856201);
      _kInitialPosition =
          CameraPosition(target: _kMapCenter, zoom: 15.0, tilt: 0, bearing: 0);
    });
  }

  @override
  void initState() {
    super.initState();
    updateLocationMap();
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
                      'Wifi Balikpapan',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: GoogleMap(
                initialCameraPosition: _kInitialPosition,
                markers: Set<Marker>.of(_markers),
                // onMapCreated: (GoogleMapController controller) {
                //   setState(() {
                //     _markers.add(
                //       Marker(
                //         markerId: MarkerId('231'),
                //         position: LatLng(
                //             double.parse(
                //                 widget.detailIncident['lat'].toString()),
                //             double.parse(
                //                 widget.detailIncident['lng'].toString())),
                //         infoWindow: InfoWindow(
                //             title: widget.detailIncident['title']),
                //       ),
                //     );
                //   });
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
