import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return ListView.builder(itemBuilder: (context, index) {
          var actualAgent = controller.agents[index];
          return ListTile(
            title: Text(actualAgent.name),
          );
        });
      }),
    );
  }
}
