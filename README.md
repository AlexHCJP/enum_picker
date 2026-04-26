# enum_picker

A Flutter widget that displays a bottom sheet with a Cupertino-style scroll picker for any Dart enum.

## Usage

```dart
enum ProfileScreenMode { other, preview, response, blocked, hidden }

final mode = await const EnumPicker<ProfileScreenMode>(
  values: ProfileScreenMode.values,
).view(context);

if (mode == null) return; // user dismissed
```

`view()` returns the selected value, or `null` if the sheet was dismissed.
