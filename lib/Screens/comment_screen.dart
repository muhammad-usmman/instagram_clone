import 'package:flutter/material.dart';
import 'package:instagram_clone/utilites/colors.dart';

import '../Widgets/Comment_card.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kTextTabBarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('url'),
                radius: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'comment as USername',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: const Icon(
                    Icons.send,
                    color: blueColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
