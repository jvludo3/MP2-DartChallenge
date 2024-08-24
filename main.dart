import 'dart:math';

// TODO: Implement the Song class
class Song {
  String title, artist; // Song title and artist
  Duration duration; // Song duration

  Song({required this.title, required this.artist, required this.duration});

  // Return song details as a formatted string
  @override
  String toString() =>
      '$title by $artist (${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')})';
}

// TODO: Implement the Playlist class
class Playlist {
  String name; // Playlist name
  List<Song> tracks = []; // List of songs

  Playlist(this.name);

  // Add a song to the playlist
  void insert(Song track) => tracks.add(track);

  // Calculate total duration of all songs
  Duration calculateDuration() =>
      tracks.fold(Duration.zero, (total, track) => total + track.duration);

  // Sort songs alphabetically by artist
  void orderByArtist() => tracks.sort((a, b) => a.artist.compareTo(b.artist));

  // Select a random song from the playlist
  Song pickRandom() => tracks[Random().nextInt(tracks.length)];

  // Return playlist details as a formatted string
  @override
  String toString() => 'Playlist: $name\n' + tracks.join('\n');
}

// TODO: Implement the MusicFestival class
class MusicFestival {
  String title; // Music festival title
  List<Playlist> stages = []; // List of stages (playlists)

  MusicFestival(this.title);

  // Add a stage (playlist) to the festival
  void addStage(Playlist stage) => stages.add(stage);

  // Calculate total duration of all stages
  Duration totalTime() =>
      stages.fold(Duration.zero, (total, stage) => total + stage.calculateDuration());

  // Display a random song from each stage
  void showRandomTracks() {
    for (var stage in stages) print('${stage.name}: ${stage.pickRandom()}');
  }

  // Return festival details as a formatted string
  @override
  String toString() => 'Music Festival: $title\nStages:\n' + stages.join('\n\n');
}

void main() {
  print('Welcome to the Music Festival Playlist Manager!');

  // Define Boy Pablo songs
  var tracks = [
    Song(title: 'Everytime', artist: 'Boy Pablo', duration: Duration(minutes: 3, seconds: 30)),
    Song(title: 'Feeling Lonely', artist: 'Boy Pablo', duration: Duration(minutes: 3, seconds: 5)),
    Song(title: 'Dance, Baby!', artist: 'Boy Pablo', duration: Duration(minutes: 4, seconds: 30)),
    Song(title: 'Sick Feeling', artist: 'Boy Pablo', duration: Duration(minutes: 3, seconds: 15)),
    Song(title: 't-shirt', artist: 'Boy Pablo', duration: Duration(minutes: 3, seconds: 45)),
    Song(title: 'Hey Girl', artist: 'Boy Pablo', duration: Duration(minutes: 3, seconds: 0)),
    Song(title: 'Losing You', artist: 'Boy Pablo', duration: Duration(minutes: 3, seconds: 20)),
  ];

  // Create playlists (stages)
  var mainStage = Playlist('Main Stage')
    ..insert(tracks[0])
    ..insert(tracks[3])
    ..insert(tracks[4])
    ..insert(tracks[5])
    ..insert(tracks[6]);

  var indieStage = Playlist('Indie Stage')
    ..insert(tracks[1])
    ..insert(tracks[0])
    ..insert(tracks[3])
    ..insert(tracks[6])
    ..insert(tracks[4]);

  var electronicStage = Playlist('Electronic Stage')
    ..insert(tracks[2])
    ..insert(tracks[5])
    ..insert(tracks[6])
    ..insert(tracks[0])
    ..insert(tracks[1]);

  // Create and populate the music festival
  var festival = MusicFestival('Summer Fest 2024')
    ..addStage(mainStage)
    ..addStage(indieStage)
    ..addStage(electronicStage);

  // Display the total duration of the festival
  print('Total Festival Duration: ${festival.totalTime().inSeconds} seconds');

  // Show a random song from each stage
  festival.showRandomTracks();

  // Sort and display the main stage playlist by artist
  mainStage.orderByArtist();
  print('\nMain Stage playlist sorted by artist:');
  print(mainStage);
}
