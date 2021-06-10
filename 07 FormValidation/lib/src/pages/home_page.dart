import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/productosBloc.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _createButton(context),
    );
  }

  Widget _createButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'producto'),
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
    );
  }

  Widget _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.produtoStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos!.length,
            itemBuilder: (context, i) =>
                _createItem(context, productosBloc, productos[i]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _createItem(
    BuildContext context,
    ProductosBloc productosBloc,
    ProductoModel product,
  ) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) => productosBloc.borrarProducto(product.id),
      child: Card(
        child: Column(
          children: [
            FadeInImage(
              image: NetworkImage(product.fotoUrl),
              placeholder: AssetImage('assets/jar-loading.gif'),
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text('${product.titulo} - ${product.valor}'),
              subtitle: Text('${product.id}'),
              onTap: () =>
                  Navigator.pushNamed(context, 'producto', arguments: product),
            ),
          ],
        ),
      ),
    );
  }
}
