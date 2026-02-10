import 'package:flutter/material.dart';
import 'package:geneze/app/geneze_app.dart';
import 'package:geneze/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Dependency Injection
  setupLocator();

  runApp(const GenezeApp());
}