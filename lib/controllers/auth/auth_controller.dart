import 'package:elevate_ecommerce/models/facebook.dart';
import 'package:elevate_ecommerce/shared/widgets/common_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final GetStorage authBox = GetStorage();

  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  var displayAddress = ''.obs;
  var displayUserPhoneNumber = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  FaceBookModel? faceBookModel;

  var isSignedIn = false;

  User? get userProfileData => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
        (userProfileData != null ? userProfileData!.displayName : "")!;
    displayUserPhoto.value =
        (userProfileData != null ? userProfileData!.photoURL : "")!;
    displayUserEmail.value =
        (userProfileData != null ? userProfileData!.email : "")!;

    super.onInit();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update();
  }

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String address,
    required String phonenumber,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });

      update();

      Get.offNamed('/loginSucess');
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      CommonWidgets.snackBar(title, message);
    } catch (error) {
      CommonWidgets.snackBar("Error!!!", error.toString());
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      update();
      Get.offNamed('/loginSucess');
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      CommonWidgets.snackBar(title, message);
    } catch (error) {
      CommonWidgets.snackBar("Error!!!", error.toString());
    }
  }

  void signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();

      Get.offNamed('/loginSucess');
    } catch (error) {
      CommonWidgets.snackBar("Error!!!", error.toString());
    }
  }

  void signUpWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final accesToken = loginResult.accessToken!.token;
    final credential = FacebookAuthProvider.credential(accesToken);
    await auth.signInWithCredential(credential);

    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      displayUserPhoto.value = faceBookModel!.faceBookPhotoModel!.url!;
      displayUserEmail.value = faceBookModel!.email!;
      displayUserName.value = faceBookModel!.name!;
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed('/loginSucess');
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }
      CommonWidgets.snackBar(title, message);
    } catch (error) {
      CommonWidgets.snackBar("Error!!!", error.toString());
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';
      isSignedIn = false;
      authBox.remove("auth");
      update();

      Get.offNamed('/home');
     // CommonWidgets.snackBar("Success", "Log out");
    } catch (error) {
      CommonWidgets.snackBar("Error!!!", error.toString());
    }
  }
}
