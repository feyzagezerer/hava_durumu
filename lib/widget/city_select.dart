import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  @override
  _SehirSecWidgetState createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şehir Arama"),
      ),
      body: Form(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: "Şehir",
                    hintText: "Şehir arayın",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pop(
                    context,
                    _textController
                        .text); //geriye veri göndermek için, bu sayfayı açan sayfaya geri gider ve istediğin veriyi yolluyosun
              },
            )
          ],
        ),
      ),
    );
  }
}
