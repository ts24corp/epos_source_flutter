class PosSession {
  String sLastUpdate;
  bool cashControl;
  bool cashJournalId;
  int cashRegisterBalanceEnd;
  int cashRegisterBalanceEndReal;
  int cashRegisterBalanceStart;
  int cashRegisterDifference;
  bool cashRegisterId;
  int cashRegisterTotalEntryEncoding;
  List<dynamic> configId;
  String createDate;
  List<dynamic> createUid;
  List<dynamic> crmTeamId;
  List<dynamic> currencyId;
  String displayName;
  int id;
  List<dynamic> journalIds;
  int loginNumber;
  String name;
  List<dynamic> orderIds;
  int pickingCount;
  bool rescue;
  int sequenceNumber;
  String startAt;
  String state;
  List<dynamic> statementIds;
  bool stopAt;
  List<dynamic> userId;
  String writeDate;
  List<dynamic> writeUid;

  PosSession(
      {this.sLastUpdate,
      this.cashControl,
      this.cashJournalId,
      this.cashRegisterBalanceEnd,
      this.cashRegisterBalanceEndReal,
      this.cashRegisterBalanceStart,
      this.cashRegisterDifference,
      this.cashRegisterId,
      this.cashRegisterTotalEntryEncoding,
      this.configId,
      this.createDate,
      this.createUid,
      this.crmTeamId,
      this.currencyId,
      this.displayName,
      this.id,
      this.journalIds,
      this.loginNumber,
      this.name,
      this.orderIds,
      this.pickingCount,
      this.rescue,
      this.sequenceNumber,
      this.startAt,
      this.state,
      this.statementIds,
      this.stopAt,
      this.userId,
      this.writeDate,
      this.writeUid});

  PosSession.fromJson(Map<String, dynamic> json) {
    sLastUpdate = json['__last_update'];
    cashControl = json['cash_control'];
    cashJournalId = json['cash_journal_id'];
    cashRegisterBalanceEnd = json['cash_register_balance_end'];
    cashRegisterBalanceEndReal = json['cash_register_balance_end_real'];
    cashRegisterBalanceStart = json['cash_register_balance_start'];
    cashRegisterDifference = json['cash_register_difference'];
    cashRegisterId = json['cash_register_id'];
    cashRegisterTotalEntryEncoding = json['cash_register_total_entry_encoding'];
    if (json["config_id"] != null) {
      configId = List<dynamic>.from(
          json["config_id"] != null ? json["config_id"] : []);
    }
    createDate = json['create_date'];
    if (json["create_uid"] != null) {
      createUid = List<dynamic>.from(
          json["create_uid"] != null ? json["create_uid"] : []);
    }
    if (json["crm_team_id"] != null) {
      crmTeamId = List<dynamic>.from(
          json["crm_team_id"] != null ? json["crm_team_id"] : []);
    }
    if (json["currency_id"] != null) {
      currencyId = List<dynamic>.from(
          json["currency_id"] != null ? json["currency_id"] : []);
    }
    displayName = json['display_name'];
    id = json['id'];
    if (json["journal_ids"] != null) {
      journalIds = List<dynamic>.from(
          json["journal_ids"] != null ? json["journal_ids"] : []);
    }
    loginNumber = json['login_number'];
    name = json['name'];
    if (json["order_ids"] != null) {
      orderIds = List<dynamic>.from(
          json["order_ids"] != null ? json["order_ids"] : []);
    }
    pickingCount = json['picking_count'];
    rescue = json['rescue'];
    sequenceNumber = json['sequence_number'];
    startAt = json['start_at'];
    state = json['state'];
    if (json["statement_ids"] != null) {
      statementIds = List<dynamic>.from(
          json["statement_ids"] != null ? json["statement_ids"] : []);
    }
    stopAt = json['stop_at'];
    if (json["user_id"] != null) {
      userId =
          List<dynamic>.from(json["user_id"] != null ? json["user_id"] : []);
    }
    writeDate = json['write_date'];
    if (json["write_uid"] != null) {
      writeUid = List<dynamic>.from(
          json["write_uid"] != null ? json["write_uid"] : []);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__last_update'] = this.sLastUpdate;
    data['cash_control'] = this.cashControl;
    data['cash_journal_id'] = this.cashJournalId;
    data['cash_register_balance_end'] = this.cashRegisterBalanceEnd;
    data['cash_register_balance_end_real'] = this.cashRegisterBalanceEndReal;
    data['cash_register_balance_start'] = this.cashRegisterBalanceStart;
    data['cash_register_difference'] = this.cashRegisterDifference;
    data['cash_register_id'] = this.cashRegisterId;
    data['cash_register_total_entry_encoding'] =
        this.cashRegisterTotalEntryEncoding;
    data['config_id'] = this.configId;
    data['create_date'] = this.createDate;
    data['create_uid'] = this.createUid;
    data['crm_team_id'] = this.crmTeamId;
    data['currency_id'] = this.currencyId;
    data['display_name'] = this.displayName;
    data['id'] = this.id;
    data['journal_ids'] = this.journalIds;
    data['login_number'] = this.loginNumber;
    data['name'] = this.name;
    data['order_ids'] = this.orderIds;
    data['picking_count'] = this.pickingCount;
    data['rescue'] = this.rescue;
    data['sequence_number'] = this.sequenceNumber;
    data['start_at'] = this.startAt;
    data['state'] = this.state;
    data['statement_ids'] = this.statementIds;
    data['stop_at'] = this.stopAt;
    data['user_id'] = this.userId;
    data['write_date'] = this.writeDate;
    data['write_uid'] = this.writeUid;
    return data;
  }
}
