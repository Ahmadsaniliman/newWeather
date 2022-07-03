import 'package:flutter/material.dart';
import 'package:newweatherapp/ui/welcome/components/image_cover.dart';
import 'package:newweatherapp/ui/welcome/components/text_column.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            ImageCover(),
            TextColumn(),
          ],
        ),
      ),
    );
  }
}
