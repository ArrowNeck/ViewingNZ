import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:viewing_nz/core/extensions/formatting_extension.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/custom_range_slider.dart';
import 'package:viewing_nz/core/widgets/custom_single_slider.dart';
import 'package:viewing_nz/core/widgets/custom_wrapper_builder.dart';
import 'package:viewing_nz/core/widgets/icon_buttons.dart';
import 'package:viewing_nz/core/widgets/input_field.dart';
import 'package:viewing_nz/core/widgets/section_label.dart';
import 'package:viewing_nz/core/widgets/sliding_segmented_control.dart';
import 'package:viewing_nz/core/widgets/submit_button.dart';
import 'package:viewing_nz/features/home/widgets/filter_divider.dart';

class HomeAdvancedFilter extends StatefulWidget {
  const HomeAdvancedFilter({super.key});

  @override
  State<HomeAdvancedFilter> createState() => _HomeAdvancedFilterState();
}

class _HomeAdvancedFilterState extends State<HomeAdvancedFilter> {
  final List<String> _segments = ["Buy", "Rent", "Flatmate"];
  final List<String> _timeOfDay = ["Morning", "Afternoon", "Evening"];
  final List<String> _whenList = ["Today", "Next Few Days", "Weekend"];
  final List<String> _propertyCategories = [
    "Residential",
    "Rural",
    "New Built",
  ];
  final List<String> _propertyTypes = [
    "House",
    "Apartment",
    "Unit",
    "Lifestyle Bare Land",
    "Section",
    "LifeStyle Dwelling",
    "Townhouse",
    "Studio",
    "Home & Income",
    "Multiple Properties",
    "Car Park",
    "Boat Shed",
  ];
  final List<String> _outdoorFeatures = [
    'Garden/Yard',
    'Swimming Pool',
    'Garage',
    'Balcony',
    'TV Charging Unit Station Installed',
    'Fully Fenced',
    'Outdoor Spa',
    'Shed',
    'Tennis Court',
    'Smart Home Features',
  ];
  final List<String> _indoorFeatures = [
    'Ensuite',
    'Study',
    'Bathtub',
    'Alarm System',
    'Rumpus Room',
    'Heated Tiles',
    'Broadband Internet',
    'Dishwasher',
  ];
  final List<String> _climateControlFeatures = [
    'Air Conditioning',
    'Heating',
    'Solar Panels',
    'Fireplace',
  ];
  final List<String> _accessibilityFeatures = [
    'Single Storey',
    'Elevator',
    'Wide Doorways',
    'Wheelchair Ramp',
  ];
  final ValueNotifier<bool> _searchBy = ValueNotifier(false);
  final ValueNotifier<SfRangeValues> _timeRange = ValueNotifier(
    SfRangeValues(6.0, 18.0),
  );
  final ValueNotifier<SfRangeValues> _priceRange = ValueNotifier(
    SfRangeValues(150000.0, 750000),
  );
  final ValueNotifier<SfRangeValues> _bedrooms = ValueNotifier(
    SfRangeValues(2, 4),
  );
  final ValueNotifier<SfRangeValues> _bathrooms = ValueNotifier(
    SfRangeValues(2, 4),
  );
  final ValueNotifier<int> _schoolZone = ValueNotifier(8);
  final ValueNotifier<List<String?>> _selectedTimeOfDay = ValueNotifier([]);
  final ValueNotifier<List<String?>> _selectedWhen = ValueNotifier([]);
  final ValueNotifier<List<String?>> _selectedPropertyCategory = ValueNotifier(
    [],
  );
  final ValueNotifier<List<String?>> _selectedPropertyType = ValueNotifier([]);
  final ValueNotifier<List<String?>> _selectedOutdoorFeature = ValueNotifier(
    [],
  );
  final ValueNotifier<List<String?>> _selectedIndoorFeature = ValueNotifier([]);
  final ValueNotifier<List<String?>> _selectedClimateControlFeature =
      ValueNotifier([]);
  final ValueNotifier<List<String?>> _selectedAccessibilityFeature =
      ValueNotifier([]);

  @override
  void dispose() {
    _searchBy.dispose();
    _timeRange.dispose();
    _priceRange.dispose();
    _bedrooms.dispose();
    _bathrooms.dispose();
    _schoolZone.dispose();
    _selectedTimeOfDay.dispose();
    _selectedWhen.dispose();
    _selectedPropertyCategory.dispose();
    _selectedPropertyType.dispose();
    _selectedOutdoorFeature.dispose();
    _selectedIndoorFeature.dispose();
    _selectedClimateControlFeature.dispose();
    _selectedAccessibilityFeature.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Filters",
          style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () => context.pop(),
            icon: SvgIcon(SolarIcons.closeCircle),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlidingSegmentedControl(segments: _segments),
              const Gap(32),

              SectionLabel.filter(title: "Location"),
              InputField(hintText: "Auckland City, Auckland"),
              const Gap(12),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _searchBy.value = !_searchBy.value,
                    child: ValueListenableBuilder(
                      valueListenable: _searchBy,
                      builder: (context, value, child) {
                        return SvgIcon(
                          value ? SolarIcons.checkSquare : SolarIcons.stop,
                          color: value ? AppColors.primary : null,
                        );
                      },
                    ),
                  ),
                  const Gap(8),
                  RichText(
                    text: TextSpan(
                      text: "Search by ",
                      style: context.bodyMedium,
                      children: [
                        TextSpan(
                          text: "Region, City, Suburb",
                          style: context.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              FilterDivider(),
              SectionLabel.filter(title: "When"),
              CustomWrapperBuilder(notifier: _selectedWhen, items: _whenList),
              ActionChip(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                backgroundColor: Colors.transparent,
                side: BorderSide(color: AppColors.gunmetal600),
                shape: StadiumBorder(),
                avatar: SvgIcon(
                  SolarIcons.calendar,
                  color: AppColors.gunmetal500,
                  size: 16,
                ),
                label: Text("Custom Date", style: context.bodyMedium),
                onPressed: () {},
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Time"),
              ValueListenableBuilder(
                valueListenable: _timeRange,
                builder: (context, values, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: CustomRangeSlider(
                      values: values,
                      min: 6.0,
                      max: 18.0,
                      stepSize: 1 / 12,
                      onChanged: (SfRangeValues values) {
                        _timeRange.value = values;
                      },
                      formatValue: (actualValue, formattedText) {
                        return actualValue.toFormattedTime();
                      },
                    ),
                  );
                },
              ),
              CustomWrapperBuilder(
                notifier: _selectedTimeOfDay,
                items: _timeOfDay,
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Property Category"),
              CustomWrapperBuilder(
                notifier: _selectedPropertyCategory,
                items: _propertyCategories,
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Property Types"),
              CustomWrapperBuilder(
                notifier: _selectedPropertyType,
                items: _propertyTypes,
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Price Range"),
              ValueListenableBuilder(
                valueListenable: _priceRange,
                builder: (context, values, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: CustomRangeSlider(
                      values: values,
                      min: 0,
                      max: 1000000,
                      stepSize: 1000,
                      onChanged: (SfRangeValues values) {
                        _priceRange.value = values;
                      },
                      formatValue: (actualValue, formattedText) {
                        return actualValue.toCompactCurrency();
                      },
                    ),
                  );
                },
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Bedrooms"),
              ValueListenableBuilder(
                valueListenable: _bedrooms,
                builder: (context, values, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: CustomRangeSlider(
                      values: values,
                      min: 0,
                      max: 15,
                      stepSize: 1,
                      onChanged: (SfRangeValues values) {
                        _bedrooms.value = values;
                      },
                      formatValue: (actualValue, formattedText) {
                        return actualValue.toInt().toString();
                      },
                    ),
                  );
                },
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Bathrooms"),
              ValueListenableBuilder(
                valueListenable: _bathrooms,
                builder: (context, values, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: CustomRangeSlider(
                      values: values,
                      min: 0,
                      max: 15,
                      stepSize: 1,
                      onChanged: (SfRangeValues values) {
                        _bathrooms.value = values;
                      },
                      formatValue: (actualValue, formattedText) {
                        return actualValue.toInt().toString();
                      },
                    ),
                  );
                },
              ),

              FilterDivider(),
              SectionLabel.filter(title: "School Zone (Deciles)"),
              ValueListenableBuilder(
                valueListenable: _schoolZone,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: CustomSingleSlider(
                      value: value,
                      min: 0,
                      max: 20,
                      stepSize: 1,
                      onChanged: (int value) {
                        _schoolZone.value = value;
                      },
                      formatValue: (actualValue, formattedText) {
                        return actualValue.toString();
                      },
                    ),
                  );
                },
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Keyword Search"),
              InputField(hintText: "Ex: Pool, Beach"),

              FilterDivider(),
              SectionLabel.filter(title: "Outdoor Features"),
              CustomWrapperBuilder(
                notifier: _selectedOutdoorFeature,
                items: _outdoorFeatures,
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Indoor Features"),
              CustomWrapperBuilder(
                notifier: _selectedIndoorFeature,
                items: _indoorFeatures,
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Climate Control & Energy"),
              CustomWrapperBuilder(
                notifier: _selectedClimateControlFeature,
                items: _climateControlFeatures,
              ),

              FilterDivider(),
              SectionLabel.filter(title: "Accessibility Features"),
              CustomWrapperBuilder(
                notifier: _selectedAccessibilityFeature,
                items: _accessibilityFeatures,
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButtons.icon(
                  size: 12,
                  icon: SolarIcons.stars2,
                  // borderColor: AppColors.white,
                  // iconColor: AppColors.white,
                  onPressed: () {},
                ),
                const Gap(8),
                Expanded(
                  child: SubmitButton(
                    text: "Search 2,000+ Properties",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
