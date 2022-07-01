import 'package:dynamic_form/provider.dart';
import 'package:dynamic_form/util/colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        builder: ((context, child) => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(title: 'Flutter Demo Home Page'),
            )),
        providers: [
          ChangeNotifierProvider<DynamicFormProvider>(
              create: (_) => DynamicFormProvider())
        ]);
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({super.key, required this.title});

  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    final distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);
    final blur = isPressed ? 5.0 : 30.0;
    final formBloc = context.watch<DynamicFormProvider>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            for (int x = 0; x < formBloc.textEditList.length; x++)
              TextFormField(
                controller: formBloc.textEditList[x],
              ),
            GestureDetector(
              onTap: formBloc.onPress,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: bgColor,
                      boxShadow: [
                        BoxShadow(
                          offset: -distance,
                          blurRadius: blur,
                          color: Colors.white,
                          inset: formBloc.isPress,
                        ),
                        BoxShadow(
                          offset: distance,
                          blurRadius: blur,
                          inset: formBloc.isPress,
                          color: const Color(0xffa7a9af),
                        )
                      ]),
                  child: const Center(
                      child: Text(
                    "Press Me",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          formBloc.addForm();
          if (formBloc.message == Response.fail) {
            snackBarWidget(context,
                "You have reach the maximum number of field to be created");
          } else {
            print("Succes");
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
