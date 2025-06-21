import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/media_query_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/validators.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/core/widgets/submit_button.dart';
import 'package:viewing_nz/core/widgets/sliding_segmented_control.dart';
import 'package:viewing_nz/features/viewings/models/agent_model.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';

class ContactAgentSection extends StatefulWidget {
  const ContactAgentSection({super.key, required this.agents});

  final List<AgentModel> agents;

  @override
  State<ContactAgentSection> createState() => _ContactAgentSectionState();
}

class _ContactAgentSectionState extends State<ContactAgentSection> {
  final ValueNotifier<String?> selectedEnquiry = ValueNotifier<String?>(null);
  final ValueNotifier<int> selectedAgent = ValueNotifier(0);
  final List<String> enquiryOptions = [
    'The price range',
    'Property Documentation',
    'Open Homes',
    'If the Property is Still Available',
    'A Call Back',
  ];

  @override
  void dispose() {
    selectedAgent.dispose();
    selectedEnquiry.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(title: "Contact the Agents"),
        SlidingSegmentedControl(
          segments: widget.agents.map((agent) => agent.name).toList(),
          onChanged: (value) => selectedAgent.value = value,
        ),
        const Gap(24),
        ValueListenableBuilder(
          valueListenable: selectedAgent,
          builder: (context, index, child) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.gray50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Gap(4),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          widget.agents[index].name,
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        VerticalDivider(color: AppColors.gray300, width: 24),
                        Flexible(
                          child: Text(
                            widget.agents[index].position,
                            style: context.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: ["facebook", "twitter", "instagram", "linkedin"]
                        .map(
                          (social) => IconButton(
                            onPressed: () {},
                            visualDensity: VisualDensity.compact,
                            icon: SvgPicture.asset(
                              "assets/icons/brand-$social.svg",
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: Text("Call"),
                          icon: SvgIcon.white(SolarIcons.phoneRounded),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: Text("Email"),
                          icon: SvgIcon.white(SolarIcons.letter),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: Text("Chat"),
                          icon: SvgIcon.white(SolarIcons.chatRoundLine),
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  InputField(
                    labelText: "Name",
                    hintText: "Enter name",
                    fillColor: AppColors.white,
                    textInputType: TextInputType.name,
                    validator: Validators.name,
                  ),
                  const Gap(16),
                  InputField(
                    labelText: "Email",
                    hintText: "Enter email",
                    fillColor: AppColors.white,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.email,
                  ),
                  const Gap(16),
                  InputField(
                    labelText: "Mobile Number",
                    hintText: "+64 275 555 58",
                    fillColor: AppColors.white,
                    textInputType: TextInputType.phone,
                    validator: Validators.mobileNumber,
                  ),

                  const Gap(24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "I would Like to Enquire About",
                      style: context.titleSmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Gap(8),
                  ValueListenableBuilder<String?>(
                    valueListenable: selectedEnquiry,
                    builder: (context, value, _) {
                      return ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: enquiryOptions.map((option) {
                          final isSelected = value == option;
                          return ListTile(
                            onTap: () => selectedEnquiry.value = option,
                            leading: SvgIcon(
                              isSelected
                                  ? SolarIcons.checkSquare
                                  : SolarIcons.stop,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.black,
                            ),
                            title: Text(option),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const Gap(24),
                  InputField(
                    labelText: "Your Message",
                    hintText: "Enter your message here",
                    maxLines: 3,
                    fillColor: AppColors.white,
                    textInputType: TextInputType.multiline,
                    validator: Validators.yourMessage,
                  ),
                  const Gap(24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SubmitButton(
                      width: context.screenWidth * 0.5,
                      height: 60,
                      text: "Send Message",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
