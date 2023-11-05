import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class ChatService extends ChatNotifier {
  // get instance of auth and firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // send message
  Future<void> sendMessage(String message) async {
    // get current user
    final User? user = _auth.currentUser;

    // get current user id
    final String? uid = user!.uid;

    // get current user name
    final String? name = user.displayName;

    // get current user photo url
    final String? photoUrl = user.photoURL;

    // add message to firestore
    await _firestore.collection('messages').add({
      'text': message,
      'createdAt': DateTime.now(),
      'uid': uid,
      'name': name,
      'photoUrl': photoUrl,
    });

    // construct chat room id from the current user and the reciver id
    String chatRoomId = ids.join('_');

    await _firestore.collection('chatrooms').doc(chatRoomId).set({
      'users': ids,
      'lastMessage': message,
      'lastMessageTime': DateTime.now(),
    });

  }
}