import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class SaveFile {
  save(String item) async {
    final ref = FirebaseStorage.instance.ref().child("noticias/$item");
    var url = await ref.getDownloadURL();
    var a='null';
    try {
      var imageId = await ImageDownloader.downloadImage("$url");
      if (imageId == null) {
        return true;
      }
      a = await ImageDownloader.findName(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
    return a;
  }
}
