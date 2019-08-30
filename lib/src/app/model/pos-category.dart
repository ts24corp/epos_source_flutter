class PosCategory {
  String sLastUpdate;
  List<dynamic> childId;
  String createDate;
  List<dynamic> createUid;
  String displayName;
  int id;
  String image;
  String imageMedium;
  String imageSmall;
  String name;
  dynamic parentId;
  int sequence;
  String writeDate;
  List<dynamic> writeUid;

  PosCategory(
      {this.sLastUpdate,
      this.childId,
      this.createDate,
      this.createUid,
      this.displayName,
      this.id,
      this.image,
      this.imageMedium,
      this.imageSmall,
      this.name,
      this.parentId,
      this.sequence,
      this.writeDate,
      this.writeUid});

  PosCategory.fromJson(Map<String, dynamic> json) {
    sLastUpdate = json['__last_update'];
    if (json["child_id"] != null) {
      childId =
          List<dynamic>.from(json["child_id"] != null ? json["child_id"] : []);
    }
    createDate = json['create_date'];
    if (json["create_uid"] != null) {
      createUid = List<dynamic>.from(
          json["create_uid"] != null ? json["create_uid"] : []);
    }
    displayName = json['display_name'];
    id = json['id'];
    image = json['image'];
    imageMedium = json['image_medium'];
    imageSmall = json['image_small'];
    name = json['name'];
    parentId = json['parent_id'];
    sequence = json['sequence'];
    writeDate = json['write_date'];
    if (json["write_uid"] != null) {
      writeUid = List<dynamic>.from(
          json["write_uid"] != null ? json["write_uid"] : []);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__last_update'] = this.sLastUpdate;
    data['child_id'] = this.childId;
    data['create_date'] = this.createDate;
    data['create_uid'] = this.createUid;
    data['display_name'] = this.displayName;
    data['id'] = this.id;
    data['image'] = this.image;
    data['image_medium'] = this.imageMedium;
    data['image_small'] = this.imageSmall;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    data['sequence'] = this.sequence;
    data['write_date'] = this.writeDate;
    data['write_uid'] = this.writeUid;
    return data;
  }
}
