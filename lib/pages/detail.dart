import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('详情'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () => context.go('/'), child: const Text('返回首页'))
          ],
        ),
      ),
    );
  }
}
