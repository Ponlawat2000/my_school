import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class contactscreen extends StatefulWidget {
  const contactscreen({super.key});

  @override
  State<contactscreen> createState() => _contactscreenState();
}

class _contactscreenState extends State<contactscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Contact screen"),
      ),
    );
  }
}
