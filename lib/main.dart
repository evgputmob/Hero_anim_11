import 'package:flutter/material.dart';
import 'package:hero_card/detail_view.dart';
import 'package:hero_card/space.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: spaces.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 250,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: EdgeInsets.fromLTRB(14, 17, 14, 0),
                  child: Stack(
                    children: [
                      Ink(
                        color: Colors.grey[400],
                        child: Stack(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Hero(
                                  tag: spaces[index].id,
                                  child: Image(
                                      image:
                                          AssetImage('${spaces[index].image}'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                height: 64,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Hero(
                                        tag: '${spaces[index].id}-descr',
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Text(
                                            spaces[index].description,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            right: 16,
                            bottom: 48,
                            child: Hero(
                              tag: '${spaces[index].id}-button',
                              child: Container(
                                width: 38,
                                height: 38,
                                color: Colors.yellow,
                                child: Icon(Icons.add),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailView(data: spaces[index])));
                        }),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
