import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/widgets/agent_card.dart';
import 'package:viewing_nz/features/viewings/models/agent_model.dart';

class AgentsDetailsSection extends StatelessWidget {
  const AgentsDetailsSection({super.key, required this.agents});

  final List<AgentModel> agents;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: agents.length,
        itemBuilder: (_, index) => AgentCard(agent: agents[index]),
        separatorBuilder: (_, __) => Gap(16),
      ),
    );
  }
}
