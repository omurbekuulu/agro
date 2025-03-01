import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:agro/common/widgets/customAppBarWithBack.dart';
import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/add_new_pet/cubit/add_new_pet_cubit.dart';
import 'package:agro/presentation/pages/add_new_pet/widget/breed_dropdownmenu.dart';
import 'package:agro/presentation/pages/add_new_pet/widget/pet_quantity.dart';
import 'package:agro/presentation/pages/add_new_pet/widget/month_dropdownmenu.dart';
import 'package:flutter/material.dart';
import 'package:agro/presentation/pages/landing/landing_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/customLogo.dart';

class AddNewPetPage extends StatefulWidget {
  const AddNewPetPage({super.key, required this.directionId});

  final int directionId;

  @override
  State<AddNewPetPage> createState() => _AddNewPetPageState();
}

class _AddNewPetPageState extends State<AddNewPetPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AddNewPetCubit()..initBreeds(),
          child: BlocBuilder<AddNewPetCubit, AddNewPetState>(
            builder: (context, state) {
              return state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: colors.onBackground3,
                      ),
                    )
                  : Stack(
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
                                    const MonthDropdownmenu(),
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
                                context
                                    .read<AddNewPetCubit>()
                                    .postPets(widget.directionId);
                                AppNavigator.pushAndRemove(
                                    context, const LandingPage());
                              }
                            },
                            child: const Text('Кошуу'),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
