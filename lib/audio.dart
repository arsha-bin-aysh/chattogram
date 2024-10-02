import 'package:flutter_sound/flutter_sound.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class AudioService {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();

  Future<void> startRecording() async {
    await _recorder.startRecorder(toFile: 'audio_record.aac');
  }

  Future<String?> stopRecording() async {
    final path = await _recorder.stopRecorder();
    return path;
  }

  Future<String?> uploadAudio(String path) async {
    File audioFile = File(path);
    final storageRef = FirebaseStorage.instance.ref().child('chat_audios').child('${DateTime.now().toIso8601String()}.aac');
    await storageRef.putFile(audioFile);
    final url = await storageRef.getDownloadURL();
    return url;
  }
}
