import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CheckBoxInListView(title: 'Flutter Demo Home Page'),
    );
  }
}

class CheckBoxInListView extends StatefulWidget {
  CheckBoxInListView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CheckBoxInListViewState createState() => _CheckBoxInListViewState();
}

class _CheckBoxInListViewState extends State<CheckBoxInListView> {
  List<String> _texts = [
    "1타임 09:00 ~ 09:50",
    "2타임 10:00 ~ 10:50",
    "3타임 11:00 ~ 11:50",
    "4타임 12:00 ~ 12:50",
    "5타임 13:00 ~ 13:50",
    "6타임 14:00 ~ 14:50",
    "7타임 15:00 ~ 15:50",
    "8타임 16:00 ~ 16:50",
    "9타임 17:00 ~ 17:50",
    "10타임 18:00 ~ 18:50",
    "11타임 19:00 ~ 19:50",
    "12타임 20:00 ~ 20:50"
  ];

  List<bool> _isChecked; // 체크된값.
  List<int> _checkedTime;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_texts.length, false);
    _checkedTime = List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('체크박스있는 리스트뷰'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _texts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: CheckboxListTile(
                      title: Text(_texts[index]),
                      value: _isChecked[index],
                      onChanged: (val) {
                        setState(
                              () {
                            _isChecked[index] = val;
                            print(index);
                            if (_isChecked[index] == true){
                              _checkedTime.add(index);
                            } else {
                              _checkedTime.remove(index);
                            }
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              child: RaisedButton(
                child: Text('reservation'),
                onPressed: () {
                  print(_checkedTime);
                  //체크된 값을 db로 보내서 인서트 한다.
                },
              ),
            )
          ],
        ));
  }
