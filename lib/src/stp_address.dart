class STPAddress {
  String name;
  String line1;
  String line2;
  String city;
  String state;
  String postalCode;
  String country;
  String phone;
  String email;

  STPAddress(
    {
      this.name,
      this.line1,
      this.line2,
      this.city,
      this.state,
      this.postalCode,
      this.country: 'US',
      this.phone,
      this.email
    }
  );
}