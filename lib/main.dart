import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope (child: FirebaseConnector()));
}

class FirebaseConnector extends ConsumerWidget {
  const FirebaseConnector({Key? key}):super(key:key);
  @override
  Widget build(BuildContext context, watch) {
    final firebaseConnector = watch(firebaseProvider);

    return firebaseConnector.when(
      data: (_) =>  Container(color: Colors.lime,),
      loading: () => Container(
        color: Colors.orange,
      ),
      error: (error, stackTrace) => Container(
        color: Colors.redAccent[700],
        child: Center(child: Text(error.toString())),
      ),
    );
  }
}

final firebaseProvider = FutureProvider<FirebaseApp>((ref) async {
  return Firebase.initializeApp();
});

