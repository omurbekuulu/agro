import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/add_new_pet/cubit/add_new_pet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetQuantity extends StatefulWidget {
  const PetQuantity({super.key});

  @override
  State<PetQuantity> createState() => _PetQuantityState();
}

class _PetQuantityState extends State<PetQuantity> {
  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final colors = Theme.of(context).appColors;

    return BlocBuilder<AddNewPetCubit, AddNewPetState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: '0',
            filled: true,
            fillColor: colors.onBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
          ),
          style: typography.p1.medium.copyWith(color: colors.onBackground3),
          keyboardType: TextInputType.number,
          cursorColor: colors.onBackground3,
          autocorrect: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Сураныч, маани киргизиңиз';
            }

            final number = int.tryParse(value);
            if (number == null) {
              return 'Жарактуу сан киргизиңиз';
            }

            if (number <= 0) {
              return 'Нөлдөн чоң санды киргизиңиз';
            }
            return null;
          },
          onChanged: (value) {
            context
                .read<AddNewPetCubit>()
                .updateSelectedQuantity(int.parse(value));
          },
        );
      },
    );
  }
}
