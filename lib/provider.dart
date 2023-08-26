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
          body: Selector<Model, int>(
              selector: (context, getmodel) => getmodel.getName1,
              builder: (context, model, child) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$model"),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<Model>(builder: (context, model, child) {
                        return MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            model.changename1();
                          },
                          child: const Text(
                            'Do SomeThing1',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                      Selector<Model, int>(
                        selector: (context, getmodel2) => getmodel2.getName2,
                        builder: (context, model, child) {
                          return Text(
                            "$model",
                            style: const TextStyle(fontSize: 18),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<Model>(builder: (context, model, child) {
                        return MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            model.changename2();
                          },
                          child: const Text(
                            'Do SomeThing2',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      })
                    ],
                  ),
                );
              })),
    );
  }
}

class Model extends ChangeNotifier {
  var name1 = 1;
  var name2 = 1;
  get getName1 => name1;
  get getName2 => name2;

  changename1() {
    name1++;
    notifyListeners();
  }

  changename2() {
    name2--;
    notifyListeners();
  }
}
