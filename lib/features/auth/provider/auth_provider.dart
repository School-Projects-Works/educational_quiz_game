import 'package:educational_quiz_game/core/functions/local_storage.dart';
import 'package:educational_quiz_game/core/functions/navigations.dart';
import 'package:educational_quiz_game/core/widgets/custom_dialog.dart';
import 'package:educational_quiz_game/features/auth/data/user_model.dart';
import 'package:educational_quiz_game/features/auth/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/views/home_page.dart';
import '../services/user_services.dart';

final userProvider = StateNotifierProvider<UserProvider, UserModel>((ref) {
  return UserProvider();
});

class UserProvider extends StateNotifier<UserModel> {
  UserProvider() : super(UserModel.empty());

  void setUser(UserModel user) {
    state = user;
  }

  void setUserName(String s) {
    state = state.copyWith(userName: s);
  }

  void setUserEmail(String s) {
    state = state.copyWith(email: s);
  }

  void setUserGender(String string) {
    state = state.copyWith(gender: string);
  }

  void setUserPassword(String s) {
    state = state.copyWith(password: s);
  }

  void createUser({required BuildContext context}) async {
    CustomDialogs.loading(message: 'Creating user.....');
    state = state.copyWith(
      createdAt: DateTime.now().millisecondsSinceEpoch,
      isOnline: false,
      level: 1,
    );
    var (user, message) = await UserServices.createAccount(user: state);
    if (user != null) {
      CustomDialogs.dismiss();
      CustomDialogs.toast(message: message, type: DialogType.success);
      state = UserModel.empty();
      navigateAndReplace(context, const LoginPage());
    } else {
      CustomDialogs.dismiss();
      CustomDialogs.toast(message: message, type: DialogType.error);
    }
  }

  void login({required BuildContext context}) async {
    CustomDialogs.loading(message: 'Logging in.....');
    var (user, message) =
        await UserServices.login(email: state.email, password: state.password!);
    if (user != null) {
      CustomDialogs.dismiss();
      CustomDialogs.toast(message: message, type: DialogType.success);
      state = user;
      await LocalStorage.saveData(key: 'userId', value: user.id);
      navigateAndReplace(context, const HomePage());
    } else {
      CustomDialogs.dismiss();
      CustomDialogs.toast(message: message, type: DialogType.error);
    }
  }

  void signOut() {}
}

final userFuture = FutureProvider<UserModel?>((ref) async {
  var id = await LocalStorage.getData(key: 'userId');
  if(id == null){
    return null;
  }
  var user =await UserServices.getUserById(id);
  if(user != null){
    ref.read(userProvider.notifier).setUser(user);
  }
  return user;
});


final userQueryStringProvider = StateProvider<String>((ref) => '');

final usersStreamProvider = StreamProvider.autoDispose<List<UserModel>>((ref) async* {
  var query = ref.watch(userQueryStringProvider);
  var users =  UserServices.getUsers();
  await for (var user in users) {
    if(user.isNotEmpty){
      var me = ref.watch(userProvider);
      //remove the current user from the list
      user.removeWhere((element) => element.id == me.id);
      yield user.where((element) => element.userName.toLowerCase().contains(query.toLowerCase())||element.email.contains(query.toLowerCase())).toList();
    }
  }
});