import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_drawer.dart';
import '../components/song_tile.dart';
import '../models/playlist.dart';
import '../models/song.dart';
import 'song_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    // get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  // go to a song
  void goToSong(int songIndex) {
    // update current song index
    playlistProvider.currentSongIndex = songIndex;

    // navigate to song page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // get the playlist
        final List<Song> playlist = value.playlist;

        // return scaffold
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("P L A Y L I S T"),
          ),
          drawer: const MyDrawer(),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              // get the individual song
              final Song song = playlist[index];

              // return song tile UI
              return SongTile(
                song: song,
                onTap: () => goToSong(index),
              );
            },
          ),
        );
      },
    );
  }
}
