import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class LienChange extends StatefulWidget {
  final int currentLien;
  LienChange(this.currentLien);
  @override
  _LienChangeState createState() => _LienChangeState();
}

class _LienChangeState extends State<LienChange> {
  int _lien;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lien = widget.currentLien;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.grey.shade700,
        backgroundColorEnd: Colors.blueGrey.shade900,
        title: Text('Lien Wallet'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.yellow.shade700,
            Colors.grey.shade800,
          ],
          stops: [0.0,1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(_lien.toString() + ' Lien',
                  style: TextStyle(
                    fontSize: 70.2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.black
                  ),),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 175.0, 0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    SizedBox(width: 20.1,),
                    Expanded(
                      child: RaisedButton(onPressed:(){
                        setState(() {
                          _lien = _lien + 1;
                        });

                      },
                      child: Text('+ 1 '),
                      color: Colors.green.shade800,),
                    ),
                    SizedBox(width: 20.1,),
                    Expanded(
                      child: RaisedButton(onPressed:(){
                        setState(() {
                          _lien = _lien + 5;
                        });

                      },
                        child: Text('+ 5 '),
                      color: Colors.green.shade800,),
                    ),
                    SizedBox(width: 20.1,),
                    Expanded(
                      child: RaisedButton(onPressed:(){
                        setState(() {
                          _lien = _lien + 10;
                        });

                      },
                        child: Text('+ 10 '),
                        color: Colors.green.shade800,),
                    ),
                    SizedBox(width: 20.1,),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(00.0, 370.0, 0.0, 00.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(width: 20.1,),
                    Expanded(
                      child: RaisedButton(onPressed:(){
                        setState(() {
                          _lien = _lien - 1;
                        });

                      },
                        child: Text('- 1 '),
                        color: Colors.red.shade800,),
                    ),
                    SizedBox(width: 20.1,),
                    Expanded(
                      child: RaisedButton(onPressed:(){
                        setState(() {
                          _lien = _lien - 5;
                        });

                      },
                        child: Text('- 5 '),
                        color: Colors.red.shade800,),
                    ),
                    SizedBox(width: 20.1,),
                    Expanded(
                      child: RaisedButton(onPressed:(){
                        setState(() {
                          _lien = _lien - 10;
                        });

                      },
                        child: Text('- 10 '),
                        color: Colors.red.shade800,),
                    ),
                    SizedBox(width: 20.1,),
//
                  ],
                ),
              ),
            ),
    Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 550.0, 0.0, 0.0),
                      child: Center(
                        child: RaisedButton(onPressed: (){
                          Navigator.pop(context, _lien);

                        },
                          color: Colors.black87,
                        child: Text('Save Wallet',),),
                      ),
                    )
          ],
        ),
      ),
    );
  }
}
