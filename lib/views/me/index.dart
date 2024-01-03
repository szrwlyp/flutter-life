import 'package:flutter/material.dart';
import "package:life_app/routes.dart";

class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
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
