import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginTela(),
    );
  }
}

class LoginTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),

            child: Column(
              children: [

                // MAPA EM TEMPO REAL
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapaTela(),
                      ),
                    );
                  },

                  child: menuCard(
                    Colors.blue,
                    Icons.map,
                    'Mapa em Tempo Real',
                    'Veja ônibus por perto agora',
                  ),
                ),

                SizedBox(height: 25),

                // PARADAS PRÓXIMAS
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParadasTela(),
                      ),
                    );
                  },

                  child: menuCard(
                    Colors.deepPurple,
                    Icons.location_on,
                    'Paradas Próximas',
                    'Encontre paradas ao redor',
                  ),
                ),

                SizedBox(height: 25),

                // BUSCAR LINHAS
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuscarLinhasTela(),
                      ),
                    );
                  },

                  child: menuCard(
                    Colors.lightBlue,
                    Icons.search,
                    'Buscar Linhas',
                    'Pesquise linhas específicas',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuCard(
    Color cor,
    IconData icone,
    String titulo,
    String subtitulo,
  ) {
    return Container(
      width: double.infinity,
      height: 170,

      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(25),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            icone,
            color: Colors.white,
            size: 60,
          ),

          SizedBox(height: 15),

          Text(
            titulo,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            subtitulo,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// =========================
// TELA BUSCAR LINHAS
// =========================

class BuscarLinhasTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Buscar Linhas',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(
                hintText: 'Digite o número ou nome da linha...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 25),

            Expanded(
              child: ListView(
                children: [
                  linhaCard('101', 'Linha 101', Colors.blue),
                  linhaCard('305', 'Linha 305', Colors.orange),
                  linhaCard('520', 'Linha 520', Colors.deepPurple),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget linhaCard(String numero, String nome, Color cor) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Container(
            width: 70,
            height: 70,

            decoration: BoxDecoration(
              color: cor,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Center(
              child: Text(
                numero,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(width: 20),

          Expanded(
            child: Text(
              nome,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}

// =========================
// TELA MAPA
// =========================

class MapaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '',
        ),
      ),

      body: Stack(
        children: [

          Container(
            color: Colors.grey[300],
          ),

          Positioned(
            top: 30,
            left: 20,
            right: 20,

            
            child: Column(
              children: [

                Row(
                  children: [
                    SizedBox(width: 10),
                  
                    Text(
                      'BusMaps',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                TextField(
                      decoration: InputDecoration(
                    hintText: 'Buscar linhas ou paradas...',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              height: 500,
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),

              child: ListView(
                children: [

                  Center(
                    child: Container(
                      width: 60,
                      height: 5,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Linhas Próximas',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  mapaLinha('101', 'Terminal Central', Colors.blue),
                  mapaLinha('202', 'Shopping', Colors.green),
                  mapaLinha('305', 'Universidade', Colors.orange),
                  mapaLinha('410', 'Aeroporto', Colors.red),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mapaLinha(String numero, String nome, Color cor) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            width: 70,
            height: 70,

            decoration: BoxDecoration(
              color: cor,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Center(
              child: Text(
                numero,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(width: 20),

          Expanded(
            child: Text(
              nome,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =========================
// TELA PARADAS
// =========================

class ParadasTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Paradas Próximas',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue),
              ),

              child: Row(
                children: [

                  Icon(
                    Icons.navigation,
                    color: Colors.blue,
                    size: 40,
                  ),

                  SizedBox(width: 20),

                  Expanded(
                    child: Text(
                      'Usar minha localização',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            paradaCard(
              'Praça da Matriz',
              '350m de distância',
            ),

            paradaCard(
              'Terminal Central',
              '500m de distância',
            ),

            paradaCard(
              'Shopping Center',
              '900m de distância',
            ),
          ],
        ),
      ),
    );
  }

  Widget paradaCard(String nome, String distancia) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Icon(
            Icons.location_on,
            color: Colors.blue,
            size: 40,
          ),

          SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                nome,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              Text(
                distancia,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}