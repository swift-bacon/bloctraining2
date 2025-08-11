import 'package:bloctraining2/application.dart';
import 'package:bloctraining2/injections_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
    await initializeDependencies();
    runApp(const Application());
}