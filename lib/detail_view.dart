import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

class DetailView extends StatelessWidget {
  final Space data;

  const DetailView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        //title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: data.id,
                  child: Image.asset(data.image),
                ),
                SizedBox(height: 14),
                Hero(
                  tag: '${data.id}-descr',
                  child: Material(child: Text(data.description)),
                ),
                SizedBox(height: 14),
                Hero(
                  tag: '${data.id}-button',
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Back', style: TextStyle(fontSize: 16)),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow[300],
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
