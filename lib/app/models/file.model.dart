import 'package:laserfast_app/app/models/abstract/from_json.abstract.dart';
import 'package:laserfast_app/app/shared/convert.dart';

class FileModel extends FromJsonModel {
  int? fileId;
  String? src;
  int? adId;
  String? createdAt;
  bool? isVideo;
  bool? isThumbnail;

  FileModel({this.fileId, this.src, this.adId, this.createdAt});

  FileModel.fromJson(Map<String, dynamic> json) {
    fileId = convertInt(json['file_id']);
    src = json['src'];
    adId = convertInt(json['ad_id']);
    createdAt = json['created_at'];
    isVideo = json['is_video'];
    isThumbnail = json['is_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file_id'] = fileId;
    data['src'] = src;
    data['ad_id'] = adId;
    data['is_video'] = isVideo;
    data['is_thumbnail'] = isThumbnail;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => FileModel.fromJson(json);
}
