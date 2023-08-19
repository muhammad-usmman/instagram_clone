import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// imge picker used in sign up
pickImage(ImageSource source) async{
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if(_file != null){
    return await _file.readAsBytes();

  }
  print('No image Selected');

}

showSnackBar(String content, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(content)
      ),
  );


}