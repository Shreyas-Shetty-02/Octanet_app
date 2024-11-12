import 'package:intl/intl.dart';

String formatLineStatus(String? status) {
  switch (status) {
    case '1':
      return 'Online';
    case '0':
      return 'Offline';
    case 'stopped':
      return 'Disconnected';
    default:
      return 'Unknown';
  }
}

String formatAction(String? status) {
  switch (status) {
    case 'created_device':
      return 'Device Added';
    case 'updated_device_info':
      return 'Device Updated';
    case 'moved_device':
      return 'Device Location Changed';
    case 'deleted_device':
      return 'Device Location Deleted';
    case 'added_connection':
      return 'Connection Updated';
    case 'added_reverse_connection':
      return 'Added by other Device';
    case 'updated_reverse_connection':
      return 'Updated by other Device';
    case 'deleted_reverse_connection':
      return 'Deleted by other Device';
    case 'updated_connection':
      return 'Connection Updated';
    case 'deleted_connection':
      return 'Connection Deleted';
    case 'updated_path':
      return 'Path Updated';
    case 'added_cutbox':
      return 'Cutbox Added';
    case 'updated_connection_by_cutbox':
      return 'Updated by other Device';
    case 'added_connection_by_cutbox':
      return 'Added Connection by Cutbox';
    case 'make_core_free_by_cutbox':
      return 'Make Core Free by Cutbox';
    case 'make_core_free':
      return 'Make Core Free';
    case 'make_core_faulty':
      return 'Make Core Faulty';
    case 'make_core_joined':
      return 'Make Core Joined';
    case 'updated_core_connection':
      return 'Updated Core Connection';
    case 'no_change':
      return 'No Change';
    case 'updated_core':
      return 'Updated Core';
    case 'reverse_moved_device':
      return 'Updated by other Device';
    case 'freed_reversed_core':
      return 'Updated by other Device';
    case 'reverse_updated_path':
      return 'Path Updated by other Device';
    default:
      return 'Unknown';
  }
}

String getWeeksFromTime(String? uptime) {
  final weeksRegex = RegExp(r'(\d+)w');
  final match = weeksRegex.firstMatch(uptime!);
  if (match != null) {
    return '${match.group(1)} weeks';
  } else {
    return '-';
  }
}

double getUsedMemoryPercentage(String? freeMemory, String? totalMemory) {
  double freeMem = double.tryParse(freeMemory!) ?? 0;
  double totalMem = double.tryParse(totalMemory!) ?? 1;
  double usedMem = totalMem - freeMem;
  double usedPercentage = (usedMem / totalMem) * 100;
  return double.parse(usedPercentage.toStringAsFixed(2));
}

double getUsedHDDPercentage(String? freeHddSpace, String? totalHddSpace) {
  double freeHDD = double.tryParse(freeHddSpace!) ?? 0;
  double totalHDD = double.tryParse(totalHddSpace!) ?? 1;
  double usedHDD = totalHDD - freeHDD;
  double usedPercentage = (usedHDD / totalHDD) * 100;
  return double.parse(usedPercentage.toStringAsFixed(2));
}

String formatDateTime(String dateTime) {
  DateTime parsedDate = DateTime.parse(dateTime).toLocal();
  DateFormat outputFormat = DateFormat("dd MMM yyyy, HH:mm:ss");
  return outputFormat.format(parsedDate);
}

String convertBytes(String? byteString) {
  if (byteString == null || byteString.isEmpty) {
    return '0 B';
  }
  try {
    final bytes = int.parse(byteString);
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else if (bytes < 1024 * 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024 * 1024)).toStringAsFixed(2)} TB';
    }
  } catch (e) {
    return 'Invalid data';
  }
}
