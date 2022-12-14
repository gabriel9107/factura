import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../clases/pedido.dart';
import 'CartItems.dart';
import 'navigationDrawer.dart';
// import 'package:flutter_application_2/classes/ordenCompra.dart';
// import 'package:flutter_application_2/classes/pedidos.dart';
// import 'package:flutter_application_2/screens/nav_screen.dart';

const darkBlueColor = Color(0xff486579);

class pedidop extends StatelessWidget {
  const pedidop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Siga Mobile - Pedidos'),
          backgroundColor: Color.fromARGB(255, 25, 28, 228),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {
                // showSearch(                  context: context, delegate: MySearchDelegateforProducto())
              },
            )
          ],
        ),
        drawer: NavigationDrawer(),
        body: MiPedidos());
  }
}

class MiPedidos extends StatefulWidget {
  @override
  State<MiPedidos> createState() => _MiPedidoState();
}

class _MiPedidoState extends State<MiPedidos> {
  final productCodeController = TextEditingController();
  late TextEditingController controller;

  List<Contact> _contacts = [];

  List<pedidos> _pedidosList = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Pedidos - Cliente : Gabriel Montero | 40221025725',
            style: TextStyle(color: darkBlueColor),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [CartItem()],
          // children: <Widget>[_form(), _list()],
        ),
      ),
    );
  }

  _form() => Column(
//mis controller

        children: [
          Container(
            height: 50,
            margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: autocompleteProducto(),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  ),
                ]),
          ),

          // ListTile(
          //   title: Text('Producto'),
          //   subtitle: TextFormField(
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(8))),
          //       hintText: 'Producto',
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text('Cantidad'),
                  subtitle: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: 'Cantidad',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                alignment: Alignment.topRight,
                width: 500,
                child: ElevatedButton(
                  child: Text('Agregar'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                          fontSize: 15,
                          height: 3,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          )
        ],
      );

  _list() => Expanded(
          child: Card(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: ordenCompra.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x320E151B),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                margin: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(250, 224, 224, 244),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.production_quantity_limits),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'TV',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),
                                    Text(
                                      'Tv de 32',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    Text(
                                      'Tv de 32',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFD725A),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ])
                      ],
                    ),
                  ),
                ));
          },
        ),
      ));

  _llist() => Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Scrollbar(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: darkBlueColor,
                        size: 40.0,
                      ),
                      title: Text(
                        _contacts[index].name.toUpperCase(),
                        style: TextStyle(
                            color: darkBlueColor, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_contacts[index].mobile),
                      onTap: () {},
                    ),
                    Divider(
                      height: 5.0,
                    ),
                  ],
                );
              },
              itemCount: _contacts.length,
            ),
          ),
        ),
      );

  final List<Orden_Compra> ordenCompra = [
    Orden_Compra(
        id: 1,
        nombre: 'Tv',
        imagen:
            'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
        precio: 1500.5),
    Orden_Compra(
        id: 1,
        nombre: 'cama',
        imagen:
            'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
        precio: 534.5),
    Orden_Compra(
        id: 1,
        nombre: 'telefono',
        imagen:
            'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
        precio: 155.5),
    Orden_Compra(
        id: 1,
        nombre: 'taza',
        imagen:
            'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
        precio: 5.5),
  ];
}

class autocompleteProducto extends StatelessWidget {
  const autocompleteProducto({super.key});

  static const List<String> _kOptions = <String>[
    'Tv',
    'Abanico',
    'Telefono',
    'Pantalla'
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    );
  }
}
