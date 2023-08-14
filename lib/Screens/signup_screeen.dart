import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
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
                 const  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1625895197185-efcec01cffe0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(onPressed: () {} ,
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
              InkWell(
                onTap: () {} ,
                child: Container(
                  child: Text('Log in'),
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
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Don't have an account?"),
                  ),
                  GestureDetector(
                    onTap: () {} ,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold),),
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
