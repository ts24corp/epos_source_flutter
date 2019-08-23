class ResCurrency {
  String sLastUpdate;
  bool active;
  bool createDate;
  bool createUid;
  String currencySubunitLabel;
  String currencyUnitLabel;
  bool date;
  int decimalPlaces;
  String displayName;
  String excelFormat;
  int id;
  String name;
  String position;
  int rate;
  List<dynamic> rateIds;
  double rounding;
  String symbol;
  String writeDate;
  List<dynamic> writeUid;

  ResCurrency(
      {this.sLastUpdate,
      this.active,
      this.createDate,
      this.createUid,
      this.currencySubunitLabel,
      this.currencyUnitLabel,
      this.date,
      this.decimalPlaces,
      this.displayName,
      this.excelFormat,
      this.id,
      this.name,
      this.position,
      this.rate,
      this.rateIds,
      this.rounding,
      this.symbol,
      this.writeDate,
      this.writeUid});

  ResCurrency.fromJson(Map<String, dynamic> json) {
    sLastUpdate = json['__last_update'];
    active = json['active'];
    createDate = json['create_date'];
    createUid = json['create_uid'];
    currencySubunitLabel = json['currency_subunit_label'];
    currencyUnitLabel = json['currency_unit_label'];
    date = json['date'];
    decimalPlaces = json['decimal_places'];
    displayName = json['display_name'];
    excelFormat = json['excel_format'];
    id = json['id'];
    name = json['name'];
    position = json['position'];
    rate = json['rate'];
    if (json["rate_ids"] != null) {
      rateIds =
          List<dynamic>.from(json["rate_ids"] != null ? json["rate_ids"] : []);
    }
    rounding = json['rounding'];
    symbol = json['symbol'];
    writeDate = json['write_date'];
    if (json["write_uid"] != null) {
      writeUid = List<dynamic>.from(
          json["write_uid"] != null ? json["write_uid"] : []);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__last_update'] = this.sLastUpdate;
    data['active'] = this.active;
    data['create_date'] = this.createDate;
    data['create_uid'] = this.createUid;
    data['currency_subunit_label'] = this.currencySubunitLabel;
    data['currency_unit_label'] = this.currencyUnitLabel;
    data['date'] = this.date;
    data['decimal_places'] = this.decimalPlaces;
    data['display_name'] = this.displayName;
    data['excel_format'] = this.excelFormat;
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    data['rate'] = this.rate;
    data['rate_ids'] = this.rateIds;
    data['rounding'] = this.rounding;
    data['symbol'] = this.symbol;
    data['write_date'] = this.writeDate;
    data['write_uid'] = this.writeUid;
    return data;
  }
}
