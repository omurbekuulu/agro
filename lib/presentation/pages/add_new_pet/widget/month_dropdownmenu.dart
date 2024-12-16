import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/add_new_pet/cubit/add_new_pet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonthDropdownmenu extends StatefulWidget {
  const MonthDropdownmenu({super.key});

  @override
  State<MonthDropdownmenu> createState() => _MonthDropdownmenuState();
}

class _MonthDropdownmenuState extends State<MonthDropdownmenu> {
  List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return BlocBuilder<AddNewPetCubit, AddNewPetState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Уйдун жашы'),
            const SizedBox(height: 4),
            DropdownButtonFormField<int>(
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
              hint: const Text('Жашын тандаңыз'),
              items: months.map((month) {
                return DropdownMenuItem<int>(
                  value: month,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width - 80,
                    ),
                    child: Text(
                      '$month',
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
                if (state is LoadedAddNewPet) {
                  state.copyWith(selectedMonth: value);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
