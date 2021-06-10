import 'dart:io';

import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProductosBloc {
  final _productosController = new BehaviorSubject<List<ProductoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _productosProvider = ProductosProvider();

  Stream<List<ProductoModel>> get produtoStream => _productosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarProductos() async {
    final productos = await _productosProvider.loadProductos();
    _productosController.sink.add(productos);
  }

  void crearProducto(ProductoModel producto) async {
    _cargandoController.sink.add(true);
    await _productosProvider.crearProducto(producto);
    _cargandoController.sink.add(false);
  }

  void editarProducto(ProductoModel producto) async {
    _cargandoController.sink.add(true);
    await _productosProvider.editarProducto(producto);
    _cargandoController.sink.add(false);
  }

  void borrarProducto(String id) async {
    await _productosProvider.deleteProduct(id);
  }

  Future<String> subirFoto(File foto) async {
    _cargandoController.sink.add(true);
    final fotoUrl = await _productosProvider.uploadImage(foto);
    _cargandoController.sink.add(false);

    return fotoUrl;
  }

  dispose() {
    _productosController.close();
    _cargandoController.close();
  }
}
