import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list_hive/model/note.dart';

class Boxes {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<Note>(NoteAdapter());

    await Hive.openBox<Note>(Note.boxKey);
  }

  static Future<Uint8List> generateKey() async {
    const secureStorage = FlutterSecureStorage();
    // if key not exists return null
    final encryprionKey = await secureStorage.read(key: 'key');
    if (encryprionKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: 'key',
        value: base64UrlEncode(key),
      );
    }
    var key = await secureStorage.read(key: 'key');
    // await Hive.openBox<Note>(Note.boxKey,
    //     encryptionCipher: HiveAesCipher(encryptionKey),);
    return base64Url.decode(key!);
  }

  static Box<Note> getNotes() => Hive.box<Note>(Note.boxKey);

  Future<bool> hasData() async {
    final noteBox = Hive.box<Note>(Note.boxKey);
    return noteBox.length > 0;
  }
}
