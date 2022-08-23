import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/snackbar_utils.dart';

class MissionsListView extends StatefulWidget {
  const MissionsListView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;

  @override
  State<MissionsListView> createState() => _MissionsListViewState();
}

class _MissionsListViewState extends State<MissionsListView> {
  @override
  Widget build(BuildContext context) {
    final data = widget.snapshot.data;
    final docs = data!.docs;
    return ListView.builder(
      itemCount: docs.length,
      shrinkWrap: true,
      itemBuilder: ((context, index) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recompensa',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R\$ ${docs[index].data()['reward'].toString()}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              docs[index].data()['pic'].toString()),
                          radius: 25,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    docs[index].data()['name'].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    docs[index].data()['description'].toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Termos e condições',
                          style: TextStyle(fontSize: 8),
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () async {
                              final datas = widget.snapshot.data;
                              final missionId = datas!.docs[index].id;
                              final userId =
                                  FirebaseAuth.instance.currentUser!.uid;
                              try {
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userId)
                                    .collection('accepted_missions')
                                    .doc(missionId)
                                    .delete();
                                showSuccessSnackbar(context,
                                    text: 'Você não participa mais da missão');
                              } catch (e) {
                                showFailureSnackbar(context,
                                    text: 'Erro ao descadastrar a missão');
                              }
                            },
                            child: const Text(
                              'Dispensar',
                              style: TextStyle(
                                color: Color(0xff045eac),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              final datas = widget.snapshot.data;
                              final missionId = datas!.docs[index].id;
                              final userId =
                                  FirebaseAuth.instance.currentUser!.uid;
                              final mission = <String, dynamic>{
                                'name': datas.docs[index].data()['name'],
                                'description':
                                    datas.docs[index].data()['description'],
                                'pic': datas.docs[index].data()['pic'],
                                'reward':
                                    datas.docs[index].data()['reward'],
                              };
                              try {
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userId)
                                    .collection('accepted_missions')
                                    .doc(missionId)
                                    .set(mission);
                                if (!mounted) return;
                                showSuccessSnackbar(context,
                                    text: 'Você se cadastrou na missão');
                              } catch (e) {
                                showFailureSnackbar(context,
                                    text: 'Erro ao cadastrar a missão');
                              }
                            },
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: const Color(0xff045eac),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              textStyle: const TextStyle(fontSize: 12),
                            ),
                            child: const Text('Começar'),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
