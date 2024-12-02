import 'package:flutter/material.dart';

void main() {
  runApp(BenimUyg());
}

class BenimUyg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(fontFamily: 'Satisfy'), Bu uygulamadaki bütün yazıları bu fontta yazar.
      home: Scaffold(
        backgroundColor: Colors.brown[200],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/kahveci.jpg'),
                ),
                Text(
                  "Flutter Kahveci",
                  style: TextStyle(
                    fontFamily: 'Satisfy',
                    fontSize: 45,
                    color: Colors.brown[900],
                  ),
                ),
                Text(
                  'Bir Fincan Uzağında ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Container(
                  width: 300,
                  child: Divider(
                    //ekrandaki çizgiyi bu yapaar
                    height: 30,
                    color: Colors.brown[900],
                  ),
                ),
                Card(
                    //container yerine bunu kullanıyoruz
                    margin: EdgeInsets.symmetric(horizontal: 45.0),
                    color: Colors.brown[700],
                    child: ListTile(
                      //row yerine bunu kullanıyoruz daha pratik
                      leading: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      title: Text(
                        'siparis@kahveci.com.tr',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 8.0,
                ),
                Card(
                    margin: EdgeInsets.symmetric(horizontal: 45.0),
                    color: Colors.brown[700],
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      title: Text('+90 258 555 00 00',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
