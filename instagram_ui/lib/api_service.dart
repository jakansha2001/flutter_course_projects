import 'package:http/http.dart';
import 'package:instagram_ui/constants.dart';
import 'package:instagram_ui/photos_model.dart';
import 'package:instagram_ui/posts_model.dart';

class ApiService {
  Future<PostsModel> getPosts() async {
    final response = await get(Uri.parse(ApiConstants.postsUrl));
    final posts = postsModelFromJson(response.body);
    return posts;
  }

  Future<List<PhotosModel>> getPhotos() async {
    final response = await get(Uri.parse(ApiConstants.photosUrl));
    final photos = photosModelFromJson(response.body);
    return photos;
  }
}
