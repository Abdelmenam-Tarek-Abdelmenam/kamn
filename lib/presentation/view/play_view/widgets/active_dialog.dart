import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/presentation/resources/string_manager.dart';
import 'package:kamn/presentation/shared/widget/dividers.dart';

import '../../../../bloc/matches_bloc/matches_bloc.dart';

class ActiveDialog extends StatefulWidget {
  const ActiveDialog({Key? key}) : super(key: key);
  @override
  State<ActiveDialog> createState() => _ActiveDialogState();
}

class _ActiveDialogState extends State<ActiveDialog> {
  FreeGames? _value;

  @override
  void initState() {
    _value = context.read<PlayBloc>().state.userAvailable;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: Dialog(
        backgroundColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: SizedBox(
          height: FreeGames.values.length * 35 + 115,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        StringManger.freeToPlay,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Dividers.h10,
                    Column(
                      children: FreeGames.values
                          .map((i) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Radio<FreeGames>(
                                        value: i,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      i.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.redAccent,
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();

                              context
                                  .read<PlayBloc>()
                                  .add(const RemoveUserCheckEvent());
                            },
                            child: Text(StringManger.cancel)),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 14),
                                backgroundColor:
                                    Colors.green.withOpacity(0.75)),
                            onPressed: _value == null
                                ? null
                                : () {
                                    context
                                        .read<PlayBloc>()
                                        .add(ChangeUserCheckEvent(_value!));
                                    Navigator.of(context).pop();
                                  },
                            child: Text(StringManger.confirm)),
                      ],
                    )
                  ],
                ),
              )),
        ),
        //  contentPadding: const EdgeInsets.all(0.0),
      ),
    );
  }
}
