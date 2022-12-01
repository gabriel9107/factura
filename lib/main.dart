import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class Producto {
  late String nombre;
  late int costo;

  @override
  String toString() {
    return '$nombre ($int)';
  }

  Producto({required this.nombre, required this.costo});

  static List<Producto> getautoCompleteData = <Producto>[
    Producto(nombre: 'TV', costo: 15000),
    Producto(nombre: 'celular', costo: 30000),
    Producto(nombre: 'avanico', costo: 5000),
    Producto(nombre: 'computadora', costo: 35000)
  ];
  // static List<Producto> getautoCompleteData() {
  //   return <Producto>[
  //     Producto(nombre: 'TV', costo: 15000),
  //     Producto(nombre: 'celular', costo: 30000),
  //     Producto(nombre: 'avanico', costo: 5000),
  //     Producto(nombre: 'computadora', costo: 35000)
  //   ];
  // }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Producto> autoCompleteData = Producto.getautoCompleteData();
  List<Producto> getautoCompleteData = Producto.getautoCompleteData;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orden de Compra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Autocomplete<Producto>(
            //   optionsBuilder: (TextEditingValue textEditingValue) {
            //     return getautoCompleteData
            //         .where((Producto county) => county.nombre
            //             .toLowerCase()
            //             .startsWith(textEditingValue.text.toLowerCase()))
            //         .toList();
            //   },

// Put the arguments here
            // )
            Autocomplete<Producto>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  // if (textEditingValue.text.isNotEmpty) {
                  //   return const Iterable<String>.empty();
                  // } else {
                  return getautoCompleteData.where((Producto word) => word
                      .nombre
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                  // }
                },
                optionsViewBuilder: ((context, onSelected, options) {
                  return Material(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final option = options.elementAt(index);

                        return ListTile(
                          title: Text(option.nombre.toString()),
                          subtitle: Text(option.costo.toString()),
                          onTap: () {
                            onSelected(option);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: options.length,
                    ),
                  );
                }),
                onSelected: (selectedString) {},
                fieldViewBuilder:
                    (context, controller, focusNode, onEditingComplete) {
                  this.controller = controller;

                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    onEditingComplete: onEditingComplete,
                    decoration: InputDecoration(
                        hintText: "Productos",
                        prefixIcon:
                            const Icon(Icons.production_quantity_limits),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.green[100]!))),
                  );
                }),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                    child: ListTile(
                  title: const Text('Cantidad'),
                  subtitle: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: 'Cantidad')),
                )),
                const SizedBox(height: 5),
                Expanded(
                    child: ListTile(
                  title: const Text('Cantidad'),
                  subtitle: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: 'Cantidad')),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
