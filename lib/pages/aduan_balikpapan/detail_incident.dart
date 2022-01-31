import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tabler_icons/tabler_icons.dart';

class DetailIncident extends StatefulWidget {
  final detailIncident;
  const DetailIncident({Key? key, this.detailIncident}) : super(key: key);

  @override
  _DetailIncidentState createState() => _DetailIncidentState();
}

class _DetailIncidentState extends State<DetailIncident> {
  late GoogleMapController _controller;
  static LatLng _kMapCenter = const LatLng(0, 0);

  static CameraPosition _kInitialPosition = CameraPosition(target: _kMapCenter);

  final List<Marker> _markers = <Marker>[];

  updateLocationMap() {
    setState(() {
      _kMapCenter = LatLng(
          double.parse(widget.detailIncident['lat'].toString()),
          double.parse(widget.detailIncident['lng'].toString()));
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
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: ClipRRect(
                        child: Image.network(
                          widget.detailIncident['document'] == '-'
                              ? 'https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg'
                              : widget.detailIncident['document'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            'Deskripsi',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.detailIncident['title'] +
                                '\n' +
                                widget.detailIncident['description'],
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Lokasi',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.detailIncident['location'],
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detail Laporan',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Nomor Laporan',
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                    Text('ID' + widget.detailIncident['id'].toString()),
                    const SizedBox(height: 15),
                    Text(
                      'Tanggal Masuk',
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                    Text(widget.detailIncident['date']),
                    const SizedBox(height: 15),
                    Text(
                      'Kategori',
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                    Text(widget.detailIncident['category'] ?? 'null')
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detail Laporan',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: GoogleMap(
                        initialCameraPosition: _kInitialPosition,
                        markers: Set<Marker>.of(_markers),
                        onMapCreated: (GoogleMapController controller) {
                          setState(() {
                            _markers.add(
                              Marker(
                                markerId: MarkerId('231'),
                                position: LatLng(
                                    double.parse(widget.detailIncident['lat']
                                        .toString()),
                                    double.parse(widget.detailIncident['lng']
                                        .toString())),
                                infoWindow: InfoWindow(
                                    title: widget.detailIncident['title']),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.back, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
