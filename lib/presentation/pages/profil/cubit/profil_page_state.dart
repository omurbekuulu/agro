// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profil_page_cubit.dart';

@immutable
class ProfilPageState extends Equatable {
  const ProfilPageState({this.userName = ''});

  final String userName;

  @override
  List<Object> get props => [];

  ProfilPageState copyWith({
    String? userName,
  }) {
    return ProfilPageState(
      userName: userName ?? this.userName,
    );
  }
}
