import 'package:agro/common/widgets/customAppBarWithBack.dart';
import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/add_new_breed/cubit/add_new_breed_cubit.dart';
import 'package:agro/presentation/pages/add_new_breed/widget/breed_dropdownmenu.dart';
import 'package:agro/presentation/pages/add_new_breed/widget/pet_quantity.dart';
import 'package:agro/presentation/pages/add_new_breed/widget/season_dropdownmenu.dart';
import 'package:flutter/material.dart';
import 'package:agro/presentation/pages/landing/landing_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/customLogo.dart';

class AddNewBreedPage extends StatefulWidget {
  const AddNewBreedPage({super.key});

  @override
  State<AddNewBreedPage> createState() => _AddNewBreedPageState();
}

class _AddNewBreedPageState extends State<AddNewBreedPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AddNewBreedCubit()..getData(),
          child: BlocBuilder<AddNewBreedCubit, AddNewBreedState>(
            builder: (context, state) {
              if (state is FailureLoadAddNewBreed) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyle(color: colors.onBackground3),
                  ),
                );
              }
              if (state is LoadingAddNewBreed) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colors.onBackground3,
                  ),
                );
              }
              if (state is LoadedAddNewBreed) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        customAppBarWithBack(context,
                            title:
                                'Жаңы парода кошуу'), // TODO: implement on top of circleindicator
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BreedDropdownmenu(breeds: state.breeds),
                                const SizedBox(height: 16),
                                SeasonDropdownmenu(seasons: state.seasons),
                                const SizedBox(height: 16),
                                const Text('Уйдун саны'),
                                const SizedBox(height: 8),
                                const PetQuantity(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 74,
                      right: 16,
                      child: customLogo(),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 16,
                      right: 16,
                      child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const LandingPage()),
                            );
                          }
                        },
                        child: const Text('Кошуу'),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
