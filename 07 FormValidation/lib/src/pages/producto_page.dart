import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/productosBloc.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:formvalidation/src/models/producto_model.dart';

import 'package:formvalidation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ProductoModel productoModel = ProductoModel(id: '1');
  late ProductosBloc productosBloc;

  bool _guardando = false;

  File? _image;

  @override
  Widget build(BuildContext context) {
    productosBloc = Provider.productosBloc(context);
    final Object? prodArguments = ModalRoute.of(context)!.settings.arguments;

    if (prodArguments != null) {
      productoModel = prodArguments as ProductoModel;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('producto'),
        actions: [
          IconButton(
            onPressed: _selectGalleryPhoto,
            icon: Icon(Icons.photo_size_select_actual),
          ),
          IconButton(
            onPressed: takePhoto,
            icon: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _showPhoto(),
                _createName(),
                _createPrice(),
                _createButton(),
                _createDisponible(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      initialValue: productoModel.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
      ),
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
      onSaved: (value) => productoModel.titulo = value!,
    );
  }

  Widget _createPrice() {
    return TextFormField(
      initialValue: productoModel.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      validator: (value) {
        if (utils.isNumeric(value!)) {
          
          return null;
        } else {
          return 'Solo numeros';
        }
      },
      onSaved: (value) => productoModel.valor = double.parse(value!),
    );
  }

  Widget _createButton() {
    return ElevatedButton.icon(
      icon: Icon(Icons.save),
      label: Text('Guardar'),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        primary: Colors.deepPurple,
      ),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  Widget _createDisponible() {
    return SwitchListTile(
        value: productoModel.disponible,
        title: Text('Disponible'),
        activeColor: Colors.deepPurple,
        onChanged: (value) {
          setState(() {
            productoModel.disponible = value;
          });
        });
  }

  void _submit() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    setState(() {
      _guardando = true;
    });

    if (_image != null) {
      productoModel.fotoUrl = await productosBloc.subirFoto(_image!);
    }
    if (productoModel.id == "1") {
      productosBloc.crearProducto(productoModel);
    } else {
      productosBloc.editarProducto(productoModel);
    }
    setState(() {
      _guardando = false;
    });
    showSnackBar('Registro guardado');
    Navigator.pop(context);
  }

  void showSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }

  Widget _showPhoto() {
    
    if (productoModel.fotoUrl.length > 10) {
      return Container(
        child: FadeInImage(
          image: NetworkImage(productoModel.fotoUrl),
          placeholder: AssetImage('assets/jar-loading.gif'),
          height: 300.0,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container(
          child:
              _image == null ? Text('No image selected') : Image.file(_image!)
          /* Image(
        image: AssetImage(_image?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover, */

          );
    }
  }

  void _selectGalleryPhoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  void takePhoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: origen,
    );

    setState(() {
      if (pickedFile != null) {
        productoModel.fotoUrl = '';
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
