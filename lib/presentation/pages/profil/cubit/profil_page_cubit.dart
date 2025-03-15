import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profil_page_state.dart';

class ProfilPageCubit extends Cubit<ProfilPageState> {
  ProfilPageCubit() : super(const ProfilPageState());

  void initProfil() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final userName = sharedPreferences.getString('userName');

    emit(
      state.copyWith(userName: userName),
    );
  }
}
