import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_test/ProductDataModel.dart';
import 'Details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future<List<ProductDataModel>> ReadJsonData() async{
    final jsondata = await rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
       future:ReadJsonData(),
        builder: (context,abc){
          var list = abc.data as List<ProductDataModel>;
          return ListView.builder(
              itemCount: 5,
              itemBuilder: (context,index){
                return InkWell(
                  child: Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Image.network(
                          list[index].imageURL.toString(),
                          height: 100,
                          width: 100,
                        ),
                        Column(
                          children: [
                            Text("id : "+ list[index].id.toString(),),
                            Text("name : "+ list[index].name.toString(),),
                            Text("category : "+ list[index].category.toString(),),
                            Text("oldPrice : "+ list[index].oldPrice.toString(),),
                            Text("price : "+ list[index].price.toString(),),
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Details(
                          list[index].id.toString(),
                          list[index].name.toString(),
                          list[index].category.toString(),
                          list[index].imageURL.toString(),
                          list[index].oldPrice.toString(),
                          list[index].price.toString(),
                        )
                        )
                    );
                  },
                );
              }
          );
        },
      ),

    );
  }

}
