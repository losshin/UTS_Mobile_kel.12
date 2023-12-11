import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? fullname;

  String? get getFullname => fullname;
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Registrasi dengan email dan password
  Future<User?> regis(String fullname, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Menyimpan data tambahan seperti fullname ke Firestore
      await saveUser(fullname, result.user?.uid);

      return result.user;
    } catch (e) {
      print('Error during registration: $e');
      return null;
    }
  }

  // Login dengan email dan password
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Saat login berhasil, dapatkan dan set fullname dari Firestore
      await _getAndSetFullname(result.user?.uid);

      return result.user;
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  // Menyimpan data tambahan pengguna ke Firestore
  Future<void> saveUser(String fullname, String? userId) async {
    if (userId != null) {
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'fullname': fullname,
      });
    }
  }

  //AMBIL NILAI GAMBAR
  Future<String?> getProfileImageUrl(String? userId) async {
    try {
      if (userId != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userDoc.exists) {
          return userDoc.get('profileImageUrl');
        }
      }
    } catch (e) {
      print('Error during getting profile image URL: $e');
    }

    return null;
  }


  // Menyimpan URL gambar profil ke Firestore
  Future<void> saveProfileImageUrl(String profileImageUrl, String userId) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'profileImageUrl': profileImageUrl,
      });
    } catch (e) {
      print('Error during saving profile image URL: $e');
    }
  }

  // Mendapatkan data pengguna dari Firestore berdasarkan UID
  Future<void> _getAndSetFullname(String? userId) async {
    if (userId != null) {
      try {
        DocumentSnapshot userDoc =
            await FirebaseFirestore.instance.collection('users').doc(userId).get();

        if (userDoc.exists) {
          this.fullname = userDoc.get('fullname');
        }
      } catch (e) {
        print('Error during getting fullname: $e');
      }
    }
  }

  // Metode untuk mendapatkan fullnamenya setelah login
  Future<String?> getFullnameAfterLogin() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _getAndSetFullname(user.uid);
        return this.fullname;
      } else {
        return null;
      }
    } catch (e) {
      print('Error during getting fullname after login: $e');
      return null;
    }
  }

  // Fungsi untuk memperbarui profil pengguna
  Future<void> updateProfile(String fullname, String email, String password, {String? profileImageUrl}) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Update email
        await user.updateEmail(email);

        // Update password jika diberikan
        if (password.isNotEmpty) {
          await user.updatePassword(password);
        }

        // Simpan URL gambar profil ke Firestore jika diberikan
        if (profileImageUrl != null) {
          await saveProfileImageUrl(profileImageUrl, user.uid);
        }

        // Simpan data tambahan ke Firestore
        await saveUser(fullname, user.uid);

        // Set ulang fullname setelah update
        await _getAndSetFullname(user.uid);
      }
    } catch (e) {
      print('Error during profile update: $e');
      rethrow; // Rethrow exception untuk ditangani di tingkat UI jika perlu
    }
  }

  // Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
