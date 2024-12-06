import 'package:agro/presentation/pages/add_new_breed/cubit/breed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/add_new_breed/entities/breed.dart';

class BreedDropdownmenu extends StatefulWidget {
  const BreedDropdownmenu({super.key});

  @override
  State<BreedDropdownmenu> createState() => _BreedDropdownmenuState();
}

class _BreedDropdownmenuState extends State<BreedDropdownmenu> {
  BreedEntity? _selectedBreed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreedCubit()..getBreeds(),
      child: BlocBuilder<BreedCubit, BreedsState>(
        builder: (context, state) {
          if (state is LoadingBreeds) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is LoadedBreeds) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Уйдун пародасы'),
                const SizedBox(height: 4),
                DropdownButtonFormField<BreedEntity>(
                  hint: const Text('Порода тандаңыз'),
                  value: _selectedBreed,
                  items: state.breeds.map((breed) {
                    return DropdownMenuItem<BreedEntity>(
                      value: breed,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width - 80,
                        ),
                        child: Text(
                          breed.name!,
                          style: TextStyle(fontSize: 16),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedBreed = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            );
          }
          if (state is FailureLoadBreeds) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container();
        },
      ),
    );
  }
}
