import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../widgets/converting_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FadeInLeft(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
                Text(
                  "Currency Converter",
                  style: TextStyle(color: Colors.blue, fontSize: 24),
                ),
                SizedBox(
                  height: 30,
                ),
                ConvertingWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
