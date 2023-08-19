import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utilites/utils.dart';

import '../Widgets/text_input_fied.dart';
import '../utilites/colors.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async {
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file:_image!,
    );
    if (res != 'success') {
      showSnackBar(res, context);
    }
  }

   selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im ;
     });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2,),
              // svg image
              SvgPicture.asset('assests/ic_instagram.svg',
                color: primaryColor,
                height: 64,),
              // circular widget to acceprt and show our file
              const SizedBox(height:64),
              Stack(
                children: [
                  _image != null
              ?  CircleAvatar(
              radius: 64,
                backgroundImage: MemoryImage(_image!)
              )
                : const  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      'https://cdn.vectorstock.com/i/preview-1x/70/84/default-avatar-profile-icon-symbol-for-website-vector-46547084.jpg'
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(onPressed: selectImage() ,
                        icon: const Icon(Icons.add_a_photo)
                    ),
                  ),
                ],
              ),
              const SizedBox(height:64),
              // to accept username
              TextFieldInput(
                hinttext:'Enter your Username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              const SizedBox(height: 24,),
              //email input
              TextFieldInput(
                hinttext:'Enter your Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 24,),
              // password input
              TextFieldInput(
                hinttext:'Enter your Password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(height: 24,),
              //bio input
              TextFieldInput(
                hinttext:'Enter your Bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),
              const SizedBox(height: 24,),
              // signup button
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: Text('Sign up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              Flexible(child: Container(), flex: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // dont have an account
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Alredy have an account?"),
                  ),
                  GestureDetector(
                    onTap: () {} ,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Log in", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}
