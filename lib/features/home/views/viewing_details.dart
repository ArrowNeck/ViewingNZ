import 'package:flutter/material.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/agent_card.dart';
import 'package:viewing_nz/core/widgets/simple_appbar.dart';
import 'package:viewing_nz/features/home/widgets/additional_features_section.dart';
import 'package:viewing_nz/features/home/widgets/market_insights_section.dart';
import 'package:viewing_nz/features/home/widgets/property_value_chart.dart';
import 'package:viewing_nz/features/home/widgets/contact_agent_section.dart';
import 'package:viewing_nz/features/home/widgets/features_section.dart';
import 'package:viewing_nz/features/home/widgets/map_view_section.dart';
import 'package:viewing_nz/features/home/widgets/on_this_page_section.dart';
import 'package:viewing_nz/features/home/widgets/open_home_times_section.dart';
import 'package:viewing_nz/features/home/widgets/price_updates_section.dart';
import 'package:viewing_nz/features/home/widgets/property_details_section.dart';
import 'package:viewing_nz/features/home/widgets/requesting_button.dart';
import 'package:viewing_nz/features/home/widgets/rooms_details_section.dart';
import 'package:viewing_nz/features/home/widgets/tenants_details_section.dart';
import 'package:viewing_nz/features/home/widgets/viewing_details_header.dart';

class ViewingDetails extends StatefulWidget {
  const ViewingDetails({super.key});

  @override
  State<ViewingDetails> createState() => _ViewingDetailsState();
}

class _ViewingDetailsState extends State<ViewingDetails> {
  late final ScrollController _scrollController;
  late final List<GlobalKey> _sectionKeys;

  // Define the section keys
  final GlobalKey priceUpdateKey = GlobalKey();
  final GlobalKey openHomeTimeKey = GlobalKey();
  final GlobalKey mapViewKey = GlobalKey();
  final GlobalKey propertyDetailsKey = GlobalKey();
  final GlobalKey roomsDetailsKey = GlobalKey();
  final GlobalKey parkingDetailsKey = GlobalKey();
  final GlobalKey featuresKey = GlobalKey();
  final GlobalKey additionalFeaturesKey = GlobalKey();
  final GlobalKey tenantsKey = GlobalKey();
  final GlobalKey marketingKey = GlobalKey();
  final GlobalKey agentKey = GlobalKey();

  final List<String> _titles = [
    "Price Updates",
    "Open Home Times",
    "Map View",
    "Property Details",
    "Rooms Details",
    "Parking Details",
    "Additional Features",
    "Tenants Details",
    "Market Insights",
    "Contact the Agents",
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _sectionKeys = [
      priceUpdateKey,
      openHomeTimeKey,
      mapViewKey,
      propertyDetailsKey,
      roomsDetailsKey,
      parkingDetailsKey,
      featuresKey,
      additionalFeaturesKey,
      tenantsKey,
      marketingKey,
      agentKey,
    ];
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(title: "Details View"),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              ViewingDetailsHeader(),
              OnThisPageSection(titles: _titles, sectionKeys: _sectionKeys),
              PriceUpdatesSection(key: priceUpdateKey),
              OpenHomeTimesSection(key: openHomeTimeKey),
              RequestingButton(),
              PropertyDetailsSection(key: propertyDetailsKey),
              MapViewSection(key: mapViewKey),
              RoomsDetailsSection(key: roomsDetailsKey),
              FeaturesSection(key: featuresKey),
              AdditionalFeaturesSection(key: additionalFeaturesKey),
              TenantsDetailsSection(key: tenantsKey),

              Divider(color: AppColors.gray300),
              MarketInsightsSection(),
              SizedBox(height: 40),
              AgentCard(),
              ContactAgentSection(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
