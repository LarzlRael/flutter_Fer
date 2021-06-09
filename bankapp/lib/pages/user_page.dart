import 'package:bankapp/bloc/bloc.dart';
import 'package:bankapp/sharedPreferences/user_preferences.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool useFinger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuario',
          style: TextStyle(
            color: Color(0xff734583),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          _createProfile(context),
          _createEnteredWithFingerPrint(),
          _creatServices(),
          
          _logout(context),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }

  Widget _createProfile(BuildContext context) {
    final prefs = UserPreferences();
    final query = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: FadeInImage(
              width: query.width * 0.25,
              height: query.width * 0.25,
              placeholder: AssetImage('loading.gif'),
              image: AssetImage('assets/publicidad.jpg'),
            ),
          ),
        ),
        Text(
          '${prefs.name}'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Widget _createEnteredWithFingerPrint() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.fingerprint,
            size: 30,
          ),
          Text('Ingesar con huella'),
          Spacer(),
          Switch(
            value: useFinger,
            onChanged: (value) {
              setState(() {
                useFinger = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _creatServices() {
    return Expanded(
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        childAspectRatio: 2.5,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
          _createCateGory(),
        ],
      ),
    );
  }

  Widget _createCateGory() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.ac_unit,
              size: 35,
            ),
          ),
          Text('consulta', style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.lock_outline,
              ),
            ),
            Text('BloquearSesion', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          '/home',
        );
      },
    );
  }

 
}
