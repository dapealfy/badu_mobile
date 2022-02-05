import 'package:badu/pages/aduan_balikpapan/detail_incident.dart';
import 'package:flutter/material.dart';

class ItemLaporan extends StatelessWidget {
  final thumbnail;
  final status;
  final nomor_laporan;
  final title;
  final nama_user;
  final tanggal_masuk;
  final data;
  const ItemLaporan(
      {Key? key,
      this.thumbnail,
      this.status,
      this.nomor_laporan,
      this.title,
      this.nama_user,
      this.tanggal_masuk,
      this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color status_color = Colors.red;

    if (status == 'diselidiki') {
      status_color = Colors.blueGrey;
    } else if (status == 'ditolak') {
      status_color = Colors.red;
    } else if (status == 'diproses') {
      status_color = Colors.blue;
    } else if (status == 'selesai') {
      status_color = Colors.green;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailIncident(
              detailIncident: data,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 20.0,
              spreadRadius: 2.0,
              offset: const Offset(
                0.0,
                10.0,
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      thumbnail == '-'
                          ? 'https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg'
                          : thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 25,
                  right: 25,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: status_color,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        status[0].toUpperCase() + status.substring(1),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nomor_laporan,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 125,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        nama_user,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        tanggal_masuk,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
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
