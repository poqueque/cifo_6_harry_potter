import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_list.dart';
import 'package:harry_potter/services/database.dart';
import 'package:harry_potter/services/hogwarts_data.dart';
import 'package:harry_potter/services/preferences.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String status = "Inicialitzant...";

  @override
  initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 2));
    status = "Inicialitzant Preferences...";
    setState(() {});
    await Preferences.instance.init();
    status = "Preferences inicialitzades...";
    setState(() {});
    status = "Inicialitzant base de dades";
    setState(() {});
    await Database.instance.init();
    if (!mounted) return;
    HogwartsData hogwartsData = context.read<HogwartsData>();
    hogwartsData.init();
    status = "Base de dades inicialitzada";
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    status = "Arrancant aplicació...";
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CharacterList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.auto_fix_high, size: 100), Text(status)],
        ),
      ),
    );
  }
}
