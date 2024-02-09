import 'package:flutter/material.dart';
import '../models/song.dart';

class SongTile extends StatelessWidget {
  final Song song;
  final void Function()? onTap;

  const SongTile({
    super.key,
    required this.song,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(song.songName),
      subtitle: Text(song.artistName),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(song.albumArtImagePath),
      ),
      onTap: onTap,
    );
  }
}
