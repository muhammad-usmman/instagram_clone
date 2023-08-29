import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String photoId;
  final String datePublished;
  final List postUrl;
  final List profImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.photoId,
    required this.username,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJason() => {
    "description": description,
    "username": username,
    "uid": uid,

    "photoId": photoId,
    "datePublished": datePublished,
    "postUrl": postUrl,
    "profImage": profImage,
    "likes": likes,
  };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      photoId: snapshot['photoId'],
      datePublished: snapshot['datePublished'],
      postUrl: snapshot['postUrl'],
      profImage: ['profImage'],
      likes: ['likes'],
    );
  }
}
