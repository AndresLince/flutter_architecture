
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/video.dart';

// Necessary for code-generation to work
part 'video_provider.g.dart';

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
@riverpod
Future<List<Video>> video(VideoRef ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await http.get(Uri.https('copservir-backend-0aaa082390e6.herokuapp.com','/video'));

  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  List<Video> _videos = [];

  //final json = jsonDecode(response.body) as Map<String, dynamic>;
  try{
    var tagsJson = jsonDecode(response.body);

    for(final currentElement in tagsJson){
      Video currentVideo = Video.fromJson(currentElement);
      print(currentVideo);
      _videos.add(currentVideo);
    }

    //List<Video> tags = tagsJson != null ? List.from(tagsJson) : [];
  }catch(ex){
    print(ex.toString());
  }


  // Finally, we convert the Map into an Activity instance.


  return _videos;
}