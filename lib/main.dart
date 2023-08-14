import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/utilites/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAWqByAv1WSqI_ZdvEIJoUKz90E0dL3-Ww',
          appId: '1:363806902956:web:5b9a3e132e6b0964daed09',
          messagingSenderId: '363806902956',
          projectId: 'instagram-clone-86368',
          storageBucket: "instagram-clone-86368.appspot.com"
      ),
    );

  }
  else{
    await Firebase.initializeApp();

  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),

      home: const ResponsiveLayout(webScreenLayout:WebScreenLayout(), mobileScreenLayout:MobileScreenLAyout() , ),
    );
  }
}
