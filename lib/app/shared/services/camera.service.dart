import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService {
  PermissionStatus storageStatus = PermissionStatus.denied;
  PermissionStatus cameraStatus = PermissionStatus.denied;

  Future<void> init() async {
    storageStatus = await Permission.storage.status;
    cameraStatus = await Permission.camera.status;
  }

  Future<void> _askStoragePermission() async {
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
      storageStatus = await Permission.storage.status;
    }
  }

  Future<void> _askCameraPermission() async {
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
      cameraStatus = await Permission.storage.status;
    }
  }

  Future<bool> hasAllPermissions() async {
    await _askStoragePermission();
    await _askCameraPermission();

    return storageStatus == PermissionStatus.granted &&
        cameraStatus == PermissionStatus.granted;
  }

  Future<XFile?> takePhoto({
    source = ImageSource.camera,
    device = CameraDevice.front,
    maxHeight = 480.0,
    maxWidth = 480.0,
  }) async {
    if (!cameraStatus.isGranted) return null;

    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: source,
      preferredCameraDevice: device,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );

    return image;
  }
}
