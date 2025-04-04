import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/add_new_pet/cubit/add_new_pet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/breeds/entities/breed.dart';

class BreedDropdownmenu extends StatelessWidget {
  const BreedDropdownmenu({super.key, required this.breeds});

  final List<BreedEntity> breeds;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    if (breeds.isEmpty) {
      return const Text('Породалар жок'); //TODO: will be delleted
    }
    return BlocBuilder<AddNewPetCubit, AddNewPetState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Уйдун пародасы'),
            const SizedBox(height: 4),
            DropdownButtonFormField<BreedEntity>(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                filled: true,
                fillColor: colors.onBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              hint: const Text('Порода тандаңыз'),
              items: breeds.map((breed) {
                return DropdownMenuItem<BreedEntity>(
                  value: breed,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width - 80,
                    ),
                    child: Text(
                      breed.name,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'Породаны тандаңыз';
                }
                return null;
              },
              onChanged: (value) {
                context.read<AddNewPetCubit>().updateSelectedBreed(value!);
              },
            ),
          ],
        );
      },
    );
  }
}
