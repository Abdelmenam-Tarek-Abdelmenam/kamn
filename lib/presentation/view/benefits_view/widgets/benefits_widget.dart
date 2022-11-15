import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/bloc/benfits_bloc/benfits_bloc.dart';

import '../../../../data/models/benfits.dart';
import '../../../resources/asstes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../shared/widget/dividers.dart';
import '../../../shared/widget/error_image.dart';

class BenfitsWidget extends StatelessWidget {
  const BenfitsWidget(this.benefits, {Key? key}) : super(key: key);
  final List<Benefit> benefits;

  @override
  Widget build(BuildContext context) {
    bool isMedical = benefits[0] is MedicalBenefit;
    return Column(
      children: [
        Visibility(
            visible: isMedical,
            child: Wrap(
              children: DoctorType.values
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: FilterChip(
                              // backgroundColor: Colors.transparent,
                              onSelected: (_) {
                                context
                                    .read<BenfitsBloc>()
                                    .add(ChangeViewFilterEvent(e));
                              },
                              label: Text(e.toString()),
                              selected:
                                  context.watch<BenfitsBloc>().state.filter ==
                                      e),
                        ),
                      ))
                  .toList(),
            )),
        ...benefits
            .map((e) => isMedical &&
                    context.read<BenfitsBloc>().state.filter != DoctorType.all
                ? Visibility(
                    visible: context.watch<BenfitsBloc>().state.filter ==
                        (e as MedicalBenefit).type,
                    child: BenefitDesign(e))
                : BenefitDesign(e))
            .toList(),
      ],
    );
  }
}

class BenefitDesign extends StatelessWidget {
  const BenefitDesign(this.item, {Key? key}) : super(key: key);
  final Benefit item;

  @override
  Widget build(BuildContext context) {
    if (item is MedicalBenefit) {
      (item as MedicalBenefit).type ==
          context.watch<BenfitsBloc>().state.filter;
    }
    return Container(
      margin: const EdgeInsets.all(15.0).copyWith(bottom: 0),
      height: 130,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
        borderRadius: StyleManager.border,
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: PaddingManager.p8,
                  child: Hero(
                    tag: item.id,
                    child: ClipRRect(
                      borderRadius: StyleManager.border, // Image border
                      child: item.img == ""
                          ? Image.asset(
                              AssetsManager.noProductImage,
                              fit: BoxFit.cover,
                            )
                          : ErrorImage(
                              item.img,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          item.name,
                          maxLines: 1,
                          strutStyle: const StrutStyle(
                            forceStrutHeight: true,
                            height: 1.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Dividers.h5,
                      Text(
                        (item is MedicalBenefit)
                            ? (item as MedicalBenefit).type.toString()
                            : (item as SportBenefit).goods,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        item.benefit,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Center(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8)),
                            onPressed: () {},
                            child: const Text(
                              "Show more",
                              style: TextStyle(fontSize: 14),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
