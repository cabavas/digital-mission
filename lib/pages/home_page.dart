import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  bool _isObscure = false;
  double balance = 0;

  @override
  void initState() {
    super.initState();
    final uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((doc) {
      print(doc.data());
      setState(() {
        balance = double.parse(doc.data()!['balance'].toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff045eac),
        elevation: 0.0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Text('Missão Digital'),
            CircleAvatar(
              //Se usuário não tiver foto cadastrada, exibe esse avatar padrão
              backgroundImage: AssetImage('assets/img/avatar.jpg'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('App'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff045eac),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Saldo',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 40,
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff045eac),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                const SizedBox(width: 15),
                Text(_isObscure.toString()),
                if (_isObscure)
                  Text(balance.toString(),
                      style: TextStyle(color: Colors.white)),
                if (!_isObscure)
                  Container(
                    width: 35,
                    height: 15,
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                const SizedBox(
                  height: 40,
                  width: 40,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Missões'),
              TextButton(
                onPressed: () {},
                child: const Text('Ver todas'),
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream:
                FirebaseFirestore.instance.collection('missions').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                final docs = data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => Card(
                        child: Column(
                          children: [
                            const Text('Recompensa'),
                            Row(
                              children: [
                                const Text('Valor da missão'),
                                Image.asset('Imagem da missão')
                              ],
                            ),
                            const Text('Título da missão'),
                            const Text('Descrição da missão'),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text('Termos e condições')),
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('Dispensar')),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('Começar')),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
        ],
        unselectedItemColor: Colors.black87,
        selectedItemColor: const Color(0xff045eac),
      ),
    );
  }
}


//Text(docs[index].data()['name'])