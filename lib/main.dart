import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_use_case/development/view/home_view.dart';
import 'package:flutter_use_case/product/init/state_initalize.dart';
import 'package:flutter_use_case/product/state/container/product_state_container.dart';
import 'package:flutter_use_case/product/state/view_model/product_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/config/.dev.env");
  ProductStateContainer.setup();
  runApp(StateInitalize(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    context.watch<ProductViewModel>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      themeMode: context.watch<ProductViewModel>().state.themeMode,
      home: const HomeView(),
    );
  }
}