import 'package:flutter/material.dart';

// khong dat ten backbutton duoc
// trong flutter co widget ten backbutton
class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back, color: Colors.red,));
  }
}