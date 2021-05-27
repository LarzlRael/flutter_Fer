import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 10;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            /* Expanded(child: _crearImagen()), */
            _crearImagen(),
            _crearSwitch()
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen $_valorSlider',
      /* divisions: 20, */
      value: _valorSlider,
      min: 0.0,
      max: 100.0,
      onChanged: (_bloquearCheck)
          ? null
          : (value) {
              setState(() {
                _valorSlider = value;
                print(value);
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Imagen3-245003649.jpg?w=800'),
      width: _valorSlider * 2.5,
      fit: BoxFit.cover,
    );
  }

  Widget _crearCheckBox() {
    /*  return Checkbox(
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        }); */
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Check :D'),
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        });
  }
}
