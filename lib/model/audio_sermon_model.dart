import 'package:flutter_task/utils/app_images.dart';

class AudioSermon {
  final String title;
  final String content;
  final String image;

  AudioSermon(
      {required this.title, required this.image, required this.content});
}

List<AudioSermon> audioSermon = [
  AudioSermon(
      title: "Salvation ", image: AppImage.play, content: "Pst. Akanni"),
  AudioSermon(title: "Salvation", image: AppImage.play, content: "Pst. Akanni"),
  AudioSermon(
      title: "Salvation", image: AppImage.musicSign, content: "Pst. Akanni"),
  AudioSermon(
      title: "Salvation", image: AppImage.musicSign, content: "Pst. Akanni")
];
