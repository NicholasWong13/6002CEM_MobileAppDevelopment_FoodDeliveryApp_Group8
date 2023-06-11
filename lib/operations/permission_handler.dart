import 'package:permission_handler/permission_handler.dart';


// Method to check if gallery permission is granted
Future<bool> checkGalleryPermission() async {
  PermissionStatus status = await Permission.storage.status;
  return status.isGranted;
}

// Method to request gallery permission
Future<bool> requestGalleryPermission() async {
  PermissionStatus status = await Permission.storage.request();
  return status.isGranted;
}

// Method to check if camera permission is granted
Future<bool> checkCameraPermission() async {
  PermissionStatus status = await Permission.camera.status;
  return status.isGranted;
}

// Method to request camera permission
Future<bool> requestCameraPermission() async {
  PermissionStatus status = await Permission.camera.request();
  return status.isGranted;
}

// Method to check if file storage permission is granted
Future<bool> checkFileStoragePermission() async {
  PermissionStatus status = await Permission.manageExternalStorage.status;
  return status.isGranted;
}

// Method to request file storage permission
Future<bool> requestFileStoragePermission() async {
  PermissionStatus status = await Permission.manageExternalStorage.request();
  return status.isGranted;
}

// Method to check if local data storage permission is granted
Future<bool> checkLocalDataPermission() async {
  PermissionStatus status = await Permission.accessMediaLocation.status;
  return status.isGranted;
}

// Method to request local data storage permission
Future<bool> requestLocalDataPermission() async {
  PermissionStatus status = await Permission.accessMediaLocation.request();
  return status.isGranted;
}
