import 'package:flutter/material.dart';
import 'package:flutter_use_case/development/view/mixin/home_view_mixin.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> with HomeViewMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}