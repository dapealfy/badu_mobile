import 'dart:convert';
import 'dart:io';

import 'package:badu/pages/aduan_balikpapan/detail_incident.dart';
import 'package:badu/settings/color.dart';
import 'package:badu/settings/string.dart';
import 'package:badu/widgets/item_laporan.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:badu/settings/global_variable.dart' as setting;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class TambahIncident extends StatefulWidget {
  const TambahIncident({Key? key}) : super(key: key);

  @override
  _TambahIncidentState createState() => _TambahIncidentState();
}

class _TambahIncidentState extends State<TambahIncident> {
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool loading_delik = false;
  var kategoriLaporan = 'Pilih';

  // Ambil File
  // String _filePath;
  List uploadPath = [];
  void getFilePath() async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pilih"),
          content: Container(
              // height: 150,
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(TablerIcons.camera_plus),
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  try {
                    var filePath = await _picker.getImage(
                      source: ImageSource.camera,
                      imageQuality: 25,
                    );
                    if (filePath == null) {
                      return;
                    }
                    setState(() {
                      this.uploadPath.add(filePath);
                      Navigator.pop(context);
                    });
                  } on PlatformException catch (e) {
                    print("Error while picking the file: " + e.toString());
                  }
                  // if (!await Permission.camera.request().isGranted) {
                  //   showDialog(
                  //     barrierDismissible: false,
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return AlertDialog(
                  //         title: Text("Permission Required"),
                  //         content: Container(
                  //             child: Text(
                  //                 'Make sure your camera permission is granted!')),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             child: Text("OK"),
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // } else {

                  // }
                },
                title: const Text('Ambil Foto'),
              ),
              ListTile(
                leading: Icon(TablerIcons.photo),
                onTap: () async {
                  try {
                    var filePath = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['jpeg', 'png', 'heic', 'heiff'],
                    );
                    if (filePath == null) {
                      return;
                    }
                    setState(() {
                      this.uploadPath.add(filePath.files.single);
                    });
                  } on PlatformException catch (e) {
                    print("Error while picking the file: " + e.toString());
                  }
                },
                title: Text('Pilih file'),
              ),
            ],
          )),
        );
      },
    );
  }

  Widget _previewImages() {
    if (uploadPath.toString() == '[]') {
      return Container();
    } else {
      return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 150,
          width: 150,
          child: Stack(
            children: [
              Image.file(File(uploadPath[0].path), fit: BoxFit.cover),
              Positioned(
                top: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    print(uploadPath);
                    setState(() {
                      uploadPath.remove(uploadPath[0]);
                    });
                  },
                  child: Container(
                    height: 15,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child:
                        const Icon(Icons.close, size: 15, color: Colors.white),
                  ),
                ),
              ),
            ],
          ));
      // return GridTile(child: Image.file(File(uploadPath), fit: BoxFit.contain));
    }
  }

  void _sendLaporan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(uploadPath[0].path),
      'title': titleController.text,
      'complaint_description': descriptionController.text,
      'location': locationController.text,
    });
    var response = await dio.post(setting.url_api + "api/complaints",
        data: formData,
        options: Options(headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + prefs.getString('token').toString()
        }));
    // Map<String, dynamic> __laporan;

    // __laporan = response.data;
    Navigator.pop(context, "Done");
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
                  const SizedBox(height: 15),
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
                          'Tambah Aduan',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    flex: 10,
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text('Foto Aduan'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '*',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  getFilePath();
                                },
                                child: uploadPath.toString() == '[]'
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 40),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: const [
                                            Center(
                                              child: Icon(
                                                TablerIcons.upload,
                                                size: 50,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text('Upload file')
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: _previewImages(),
                                      ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: const [
                                  Text('Judul Aduan'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: titleController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Masukkan judul',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: const [
                                  Text('Deskripsi Aduan'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  maxLines: 5,
                                  controller: descriptionController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Masukkan Deskripsi',
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: const [
                                  Text('Lokasi'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: locationController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Masukkan Lokasi',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        if (titleController.text != '' &&
                            uploadPath.toString() != '[]') {
                          if (loading_delik == false) {
                            setState(() {
                              loading_delik = true;
                            });
                            await Future.delayed(const Duration(seconds: 3));
                            // showDialog(
                            //   barrierDismissible: false,
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return AlertDialog(
                            //       title: Text("Under Development"),
                            //       content: Container(
                            //           child: Text(
                            //               'This Feature still have bug in it')),
                            //       actions: <Widget>[
                            //         TextButton(
                            //           child: Text("OK"),
                            //           onPressed: () {
                            //             Navigator.of(context).pop();
                            //           },
                            //         ),
                            //       ],
                            //     );
                            //   },
                            // );
                            _sendLaporan();
                          }
                        }
                      },
                      child: MediaQuery.of(context).viewInsets.bottom == 0
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: loading_delik == true
                                    ? Colors.grey
                                    : secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text('Lapor',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            )
                          : Container(),
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
