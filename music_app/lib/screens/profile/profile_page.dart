import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/profile/widgets/animation_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            BackButton(),
            Text('hehe'),
            // CircularProgressIndicator()
            // AnimatedLogo(animation: CurvedAnimation(parent: controller, curve: Curves.easeIn))
          ],
        ),
      ),
    );
  }
}
