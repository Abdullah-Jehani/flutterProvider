import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatefulWidget {
  const ProviderWidget({super.key});

  @override
  State<ProviderWidget> createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State<ProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Provider'),
            backgroundColor: Colors.blue,
          ),
          body: Consumer<Model>(builder: (context, model, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      model.changename();
                    },
                    child: const Text(
                      'Do SomeThing',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}

class Model extends ChangeNotifier {
  String name = 'Khalid';
  changename() {
    name = 'Osama';
    notifyListeners();
  }
}
