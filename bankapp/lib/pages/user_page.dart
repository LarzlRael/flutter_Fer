import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuario',
          style: TextStyle(color: Colors.deepPurpleAccent),
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
        ]),
      ),
    );
  }

  Widget _createProfile(BuildContext context) {
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
          'Jhoe Doe'.toUpperCase(),
          style: TextStyle(
            color: Color(0xff01B55A),
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
            color: Color(0xff01B55A),
            size: 30,
          ),
          Text('Ingesar con huella'),
          Spacer(),
          Switch(
            value: true,
            onChanged: (value) {},
            activeColor: Color(0xff01B55A),
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
              color: Color(0xff01B55A),
              size: 35,
            ),
          ),
          Text('consulta', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.lock_outline,
                color: Color(0xff01B55A),
              ),
            ),
            Text('BloquearSesion', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/',
        );
      },
    );
  }
}
