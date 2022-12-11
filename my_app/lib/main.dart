import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.lightGreen),//Creates the main color of the app
        home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _randomWordPairs = <WordPair>[];

  //This widget creates the listview of the word pairs
  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, item) {
        //If we get an odd number add a divider
        if(item.isOdd) return Divider();

        //number devided by 2 gives us pair amount
        final index = item ~/2;

        //if we get the end of the list create new word pairs
        if(index >= _randomWordPairs.length){
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){
    return ListTile(title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18)));
}

  Widget build (BuildContext context) {
      return Scaffold(
          appBar: AppBar (title: Text('Flutter Assignment')),
          body: _buildList());
    }
}


