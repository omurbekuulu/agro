import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../domain/breeds/entities/breed.dart';

class BreedDropdownmenu extends StatefulWidget {
  const BreedDropdownmenu({super.key, required this.breeds});

  final List<BreedEntity> breeds;

  @override
  State<BreedDropdownmenu> createState() => _BreedDropdownmenuState();
}

class _BreedDropdownmenuState extends State<BreedDropdownmenu> {
  BreedEntity? _selectedBreed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    if (widget.breeds.isEmpty) {
      return const Text('Породалар жок'); //TODO: will be dellete
    }
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
          items: widget.breeds.map((breed) {
            return DropdownMenuItem<BreedEntity>(
              value: breed,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width - 80,
                ),
                child: Text(
                  breed.name!,
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
            setState(() {
              _selectedBreed = value;
            });
          },
        ),
      ],
    );
  }
}
