import 'package:flutter/material.dart';
import './randomWords.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.lightGreen),
        //Creates the main color of the app
        home: HomeScreen()
        );

  }



}

class HomeScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Assignment'),
          actions: <Widget>[
            //IconButton(onPressed: _goHome, icon: Icon(Icons.home)),
            IconButton(onPressed: () =>
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => RandomWords())),
                icon: Icon(Icons.list))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text('Flutter Assignment of Ozan Hasdemir and Monica Vargas'),
              Image.network('https://picsum.photos/250?image=9')],)
                ));
  }


}