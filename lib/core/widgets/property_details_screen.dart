import 'package:flutter/material.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/simple_appbar.dart';
import 'package:viewing_nz/features/viewings/models/agent_model.dart';
import 'package:viewing_nz/core/widgets/additional_features_section.dart';
import 'package:viewing_nz/core/widgets/agents_details_section.dart';
import 'package:viewing_nz/core/widgets/market_insights_section.dart';
import 'package:viewing_nz/core/widgets/contact_agent_section.dart';
import 'package:viewing_nz/core/widgets/features_section.dart';
import 'package:viewing_nz/core/widgets/map_view_section.dart';
import 'package:viewing_nz/core/widgets/on_this_page_section.dart';
import 'package:viewing_nz/core/widgets/open_home_times_section.dart';
import 'package:viewing_nz/core/widgets/parking_details_section.dart';
import 'package:viewing_nz/core/widgets/price_updates_section.dart';
import 'package:viewing_nz/core/widgets/property_details_section.dart';
import 'package:viewing_nz/core/widgets/requesting_button.dart';
import 'package:viewing_nz/core/widgets/rooms_details_section.dart';
import 'package:viewing_nz/core/widgets/tenants_details_section.dart';
import 'package:viewing_nz/core/widgets/property_details_header.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({super.key});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
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

  final List<AgentModel> agents = [
    AgentModel(
      name: "James Carter",
      position: "Real Estate Sales Associate",
      profile: "https://i.pravatar.cc/250?img=12",
      rating: 4.7,
      reviews: 45,
      activeListings: 3,
    ),
    AgentModel(
      name: "Sophia Bennett",
      position: "Senior Property Consultant",
      profile: "https://i.pravatar.cc/250?img=45",
      rating: 4.9,
      reviews: 50,
      activeListings: 5,
    ),
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
              PropertyDetailsHeader(),
              OnThisPageSection(titles: _titles, sectionKeys: _sectionKeys),
              PriceUpdatesSection(key: priceUpdateKey),
              OpenHomeTimesSection(key: openHomeTimeKey),
              RequestingButton(),
              PropertyDetailsSection(key: propertyDetailsKey),
              MapViewSection(key: mapViewKey),
              RoomsDetailsSection(key: roomsDetailsKey),
              ParkingDetailsSection(key: parkingDetailsKey),
              FeaturesSection(key: featuresKey),
              AdditionalFeaturesSection(key: additionalFeaturesKey),
              TenantsDetailsSection(key: tenantsKey),

              Divider(color: AppColors.gray300),

              MarketInsightsSection(key: marketingKey),
              AgentsDetailsSection(agents: agents),
              ContactAgentSection(agents: agents, key: agentKey),
            ],
          ),
        ),
      ),
    );
  }
}
