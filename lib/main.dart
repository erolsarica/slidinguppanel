import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PanelController pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yukarı Kayan Panel"),
      ),
      body: SlidingUpPanel(
        renderPanelSheet: false,
        controller: pc,
        panel: _floatingPanel(),
        body: _body(),
        collapsed: _floatingCollapsed(),

        ),

    );
  }

  Widget _body(){
    return Container(
      child: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Paneli Aç"),
              onPressed: () => pc.open(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(150, 50.0),
                  padding: EdgeInsets.all(15.0),
                  textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Paneli Kapat"),
              onPressed: () => pc.close(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(150, 50.0),
                  padding: EdgeInsets.all(15.0),
                  textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 8.0),
            child: ElevatedButton(
              child: Text("Paneli Gizle"),
              onPressed: () => pc.hide(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(150, 50.0),
                  padding: EdgeInsets.all(15.0),
                  textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Paneli Göster"),
              onPressed: () => pc.show(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(150, 50.0),
                  textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text("Ana Sayfa",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 22.0),),
          ),
        ],
      ),
    );
  }

  Widget _floatingCollapsed(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(
          "Yukarı Kaydırın",
          style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _floatingPanel(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]
      ),
      margin: const EdgeInsets.all(24.0),
      child: Center(
        child: Text("Kayan Panel \n\n Açıklama yazılarınız bu kısımda görünecek.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 18.0),),
      ),
    );
  }
}
