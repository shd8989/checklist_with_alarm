import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HYUNDAI department store',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HYUNDAI department store'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({ Key? key }) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }

        final alreadySaved = _saved.contains(_suggestions[index]);

        return ListTile(
          title: Text(
//            _suggestions[index].asPascalCase,
            (index == 0 ? 'PC, ERP, DRM 등 로그인에 필요한 비밀번호를 부착했나요?' :
            index == 1 ? '퇴근 시 중요정보(매출 및 개인정보)를 책상위에 방치했나요?' :
            index == 2 ? '퇴근 시 개인 서랍장을 시건했나요?' :
            index == 3 ? '퇴근 시 PC 종료를 했나요?' : ''),
            style: _biggerFont,
          ),
          trailing: Icon(    // NEW from here ...
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
            semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
          ),
          onTap: () {          // NEW from here ...
            setState(() {
              if (alreadySaved) {
                _saved.remove(_suggestions[index]);
              } else {
                _saved.add(_suggestions[index]);
              }
            });                // to here.
          },
        );
      },
    );
  }
}