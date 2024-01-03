import 'package:flutter/material.dart';
import "package:life_app/routes.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouter.demo);
                },
                child: const Text('跳转到demo')),
            const SizedBox(
              child: Text('aaa'),
            )
          ],
        ),
      )),
    );
  }
}
