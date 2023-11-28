import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('首页'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () => context.go('/page1'),
                child: const Text('跳转page1')),
            ElevatedButton(
                onPressed: () => context.go('/detail'), child: const Text('详情'))
          ],
        ),
      ),
    );
  }
}
