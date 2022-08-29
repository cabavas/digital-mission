import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mission/pages/start/missions_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  bool _isObscure = false;
  double balance = 0;
  String name = '';

  @override
  initState() {
    super.initState();
    final uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((doc) {
      setState(() {
        balance = double.parse(doc.data()!['balance'].toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: Column(
        children: [
          header(),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: currentIndex == 0
                ? FirebaseFirestore.instance
                    .collection('missions')
                    .orderBy('date')
                    .snapshots()
                : FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('accepted_missions')
                    .orderBy('date')
                    .snapshots(),
            builder: (context, snapshot) {
              print('##########################');
              print(snapshot.data!.docs);
              if (snapshot.hasData) {
                return Expanded(
                  child: MissionsListView(snapshot: snapshot),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Column header() {
    return Column(
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
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
              const SizedBox(width: 15),
              if (_isObscure)
                Text(
                  'R\$ ${balance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              if (!_isObscure)
                Container(
                  width: 35,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
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
            const Text(
              'Missões',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Ver todas'),
            ),
          ],
        ),
      ],
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Pesquisar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border_outlined),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Lista',
        ),
      ],
      unselectedItemColor: Colors.black87,
      selectedItemColor: const Color(0xff045eac),
    );
  }

  AppBar getAppBar() => AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff045eac),
        elevation: 0.0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
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
      );
}
