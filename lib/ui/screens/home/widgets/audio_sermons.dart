import 'package:flutter/material.dart';
import 'package:flutter_task/model/audio_sermon_model.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/spacer.dart';

class AudioVideoSermon extends StatelessWidget {
  const AudioVideoSermon({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Audio and Video Sermons",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: AppFontWeight.medium,
                ),
          ),
          const Space(10),
          Expanded(
            child: GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: audioSermon.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            AppImage.audio,
                          ))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Image.asset(
                        audioSermon[index].image,
                        color: Colors.white,
                      ),
                      const Space(10),
                      Text(
                        audioSermon[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: AppFontWeight.bold),
                      ),
                      Text(
                        audioSermon[index].content,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: AppFontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
