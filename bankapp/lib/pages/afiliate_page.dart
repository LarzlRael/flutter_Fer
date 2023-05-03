part of 'pages.dart';

class Afiliacion extends StatefulWidget {
  @override
  _AfiliacionState createState() => _AfiliacionState();
}

class _AfiliacionState extends State<Afiliacion> {
  String _seletedOption = 'La Paz';
  TextStyle style = TextStyle(fontSize: 16, color: Colors.black54);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Afiliacion'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Para iniciar el proceso de afiliación debe ingresar los siguientes datos que seran verificados por el banco.',
                style: style,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: 'Documento de identidad'),
                    ),
                  ),
                  Container(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Complemento'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _createDropDown(),
              SizedBox(height: 20),
              Text(
                'Ingrese los últimos 8 digitos de tu tarjeta de debito.',
                style: style,
              ),
              Row(
                children: [
                  Text('Numero de tarjeta: xxxx - xxxx -', style: style),
                  Container(
                    width: 50,
                    child: TextField(),
                  ),
                  Text(
                    ' - ',
                  ),
                  Container(
                    width: 50,
                    child: TextField(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CurvedButton(
                title: 'Continuar', /*  color: Theme.of(context).accentColor */
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDropDown() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Expanded(
        child: DropdownButton(
            value: _seletedOption,
            items: getOpcionesDropDown(),
            onChanged: (opt) {
              setState(() {
                _seletedOption = opt.toString();
              });
            }),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List _poderes = ['La Paz', 'Cochabamba', 'Santa Cruz', 'Super fuerza'];
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(
        DropdownMenuItem(
          child: Text(poder, style: style),
          value: poder,
        ),
      );
    });

    return lista;
  }
}
