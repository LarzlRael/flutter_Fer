import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _crearImage(),
            _crearTitulo(),
            _crearAcciones(),
            _createText(),
            _createText(),
            _createText(),
          ],
        ),
      ),
    );
  }

  Widget _crearImage() {
    return Image(
      image: NetworkImage(
          'https://cdn.pling.com/img/9/1/b/c/1dd37008d0bdacb47b191ab5246d848ed486.jpg'),
    );
  }

  Widget _crearTitulo() {
    final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
    final subTitleStyle = TextStyle(fontSize: 17.0, color: Colors.grey);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Osechinen lake Campground', style: titleStyle),
                SizedBox(
                  height: 7.0,
                ),
                Text('Kanderte, Switchzaldn', style: subTitleStyle),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red, size: 30.0),
          Text('41', style: TextStyle(fontSize: 20.0))
        ],
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _action(Icons.call, 'Call'),
        _action(Icons.near_me, 'Route'),
        _action(Icons.share, 'Share'),
      ],
    );
  }

  Widget _action(IconData icon, String title) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 40.0),
        SizedBox(
          height: 5.0,
        ),
        Text(title, style: TextStyle(fontSize: 15.0, color: Colors.blue)),
      ],
    );
  }

  Widget _createText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        textAlign: TextAlign.justify,
        style: TextStyle(height: 1.5, fontSize: 16),
      ),
    );
  }
}
