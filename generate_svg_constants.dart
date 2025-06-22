import 'dart:io';
import 'dart:developer';

void main() async {
  const String basePath = 'assets/icons/solar_icons/';
  final iconsDir = Directory(basePath);

  if (!iconsDir.existsSync()) {
    log('Directory not found: $basePath');
    return;
  }

  final buffer = StringBuffer()
    ..writeln('import \'package:viewing_nz/core/res/svg_icon.dart\';\n')
    ..writeln('class SolarIcons {')
    ..writeln("  static const String _basePath = '$basePath';\n");

  final svgFiles = iconsDir
      .listSync(recursive: true)
      .where((file) => file is File && file.path.endsWith('.svg'));

  for (var file in svgFiles) {
    final filePath = file.path.replaceAll('\\', '/');
    final fileName = filePath.split('/').last;
    final nameWithoutExtension = fileName.replaceAll('.svg', '');
    final constantName = _toCamelCase(nameWithoutExtension);

    buffer.writeln(
      "  static const SvgIconData $constantName = SvgIconData('\${_basePath}$fileName');",
    );
  }

  buffer.writeln('}');

  final outputFile = File('lib/core/res/solar_icons.dart');
  await outputFile.writeAsString(buffer.toString());
  log('Successfully generated: lib/core/res/solar_icons.dart');
}

String _toCamelCase(String input) {
  final parts = input.split('_');
  if (parts.isEmpty) return input;

  return parts.first +
      parts
          .skip(1)
          .map((p) => p.isEmpty ? '' : p[0].toUpperCase() + p.substring(1))
          .join();
}


// RUN => dart generate_svg_constants.dart
// It will output a solar_icons.dart with all your SVG files turned into SvgIconData constants automatically.