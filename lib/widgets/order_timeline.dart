import 'package:flutter/material.dart';
import 'package:textile_mobile_app/models/order.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key, required this.stage});

  final OrderStage stage;

  @override
  Widget build(BuildContext context) {
    final stages = OrderStage.values;
    return Row(
      children: List.generate(stages.length, (index) {
        final reached = index <= stage.index;
        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  if (index != 0)
                    Expanded(
                      child: Container(
                        height: 2,
                        color: reached ? Colors.white : Colors.white24,
                      ),
                    ),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: reached ? Colors.white : Colors.white24,
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (index != stages.length - 1)
                    Expanded(
                      child: Container(
                        height: 2,
                        color: index < stage.index
                            ? Colors.white
                            : Colors.white24,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                stages[index].name[0].toUpperCase() +
                    stages[index].name.substring(1),
                style: const TextStyle(fontSize: 10, color: Colors.white70),
              ),
            ],
          ),
        );
      }),
    );
  }
}
