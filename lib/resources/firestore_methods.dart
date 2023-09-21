import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/posts.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(String description,
      String uid,
      Uint8List file,
      String username,
      String profImage,) async {
    String res = "some error occured";
    try {
      String photoUrl =
      await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();

      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );
      _firestore.collection('posts').doc(postId).set(
        post.toJason(),
      );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> likePost(String postid, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postid).update({
          'likes': FieldValue.arrayRemove([uid])
        });

      } else {
        await _firestore.collection('posts').doc(postid).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      print(e.toString(),);
    }
  }
  Future<void> postComment(String postId, String text, String uid, String name, String profiePic) async {
      try{
       if(text.isNotEmpty){
         String commentId = const Uuid().v1();
         await _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
           'profilePic' : profiePic,
           'name' : name,
           'uid' : uid,
           'text': text,
           'commeentId': commentId,
           'datePublished': DateTime.now(),

         });
       } else{
         print('Text is Empty');
       }

      } catch(e){
        print(e.toString());
      }
  }
}


