import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../domain/season/entities/season.dart';

class SeasonDropdownmenu extends StatefulWidget {
  const SeasonDropdownmenu({super.key, required this.seasons});

  final List<SeasonEntity> seasons;

  @override
  State<SeasonDropdownmenu> createState() => _SeasonDropdownmenuState();
}

class _SeasonDropdownmenuState extends State<SeasonDropdownmenu> {
  SeasonEntity? _selectedSeason;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    if (widget.seasons.isEmpty) {
      return const Text('Сезондор жок');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Уйдун жашы'),
        const SizedBox(height: 4),
        DropdownButtonFormField<SeasonEntity>(
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
          items: widget.seasons.map((season) {
            return DropdownMenuItem<SeasonEntity>(
              value: season,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width - 80,
                ),
                child: Text(
                  season.name!,
                  style: TextStyle(fontSize: 16),
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
              _selectedSeason = value;
            });
          },
        ),
      ],
    );
  }
}
