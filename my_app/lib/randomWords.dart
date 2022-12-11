import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './main.dart';

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();

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

  //builds each row of word pairs for us
  Widget _buildRow(WordPair pair){
    final alreadySaved = _savedWordPairs.contains(pair);
    return ListTile(title: Text(pair.asPascalCase, style: TextStyle
      (fontSize: 18)),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border, color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if(alreadySaved){
            _savedWordPairs.remove(pair);
          }
          else{
            _savedWordPairs.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved(){
    Navigator.of (context).push(
        MaterialPageRoute (
            builder: (BuildContext context) {
              final Iterable<ListTile> tiles = _savedWordPairs.map(
                  (WordPair pair){
                    return ListTile(
                      title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16),)
                    );
                  }
              );

              final List<Widget> divided = ListTile.divideTiles(context: context, tiles: tiles).toList();

              return Scaffold(
                appBar:  AppBar(title: Text('Saved WordPairs')),
                body: ListView(children: divided,)
              );
    }));
  }

  void _goHome(){
    Navigator.push (

        context,
        MaterialPageRoute(builder: (context) => const MyApp()),);
  }


  Widget build (BuildContext context) {
    return Scaffold(
        appBar: AppBar (
            title: Text('Flutter Assignment'),
            actions: <Widget>[
              IconButton(onPressed: _goHome, icon: Icon(Icons.home)),
              IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
            ],
        ),
        body: _buildList());
  }
}

