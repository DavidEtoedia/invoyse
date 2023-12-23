class BusinessModel {
  String? businessName;
  String? businessEmail;
  String? businessAddress;
  String? businessPhone;
  String? businessCategory;
  String? amount;
  String? logo;

  BusinessModel({
    this.businessName,
    this.businessEmail,
    this.businessAddress,
    this.businessPhone,
    this.businessCategory,
    this.amount,
    this.logo,
  });

  BusinessModel copyWith({
    String? businessName,
    String? businessEmail,
    String? businessAddress,
    String? businessPhone,
    String? businessCategory,
    String? amount,
    String? logo,
  }) {
    return BusinessModel(
      businessName: businessName ?? this.businessName,
      businessEmail: businessEmail ?? this.businessEmail,
      businessAddress: businessAddress ?? this.businessAddress,
      businessPhone: businessPhone ?? this.businessPhone,
      businessCategory: businessCategory ?? this.businessCategory,
      amount: amount ?? this.amount,
      logo: logo ?? this.logo,
    );
  }

  @override
  String toString() {
    return 'BusinessModel{'
        'businessName: $businessName, '
        'businessEmail: $businessEmail, '
        'businessAddress: $businessAddress, '
        'businessPhone: $businessPhone, '
        'businessCategory: $businessCategory, '
        'amount: $amount, '
        'logo: $logo}';
  }
}
