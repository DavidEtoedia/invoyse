// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeItem {
  final String name;
  final String title;
  HomeItem({
    required this.name,
    required this.title,
  });
}

List<HomeItem> homeItem = [
  HomeItem(
      name: "Business details", title: "Logo, Name, Contact information..."),
  HomeItem(name: "Quotations", title: "Quotation list, create quotations..."),
  HomeItem(name: "Manage staff", title: "Add, Manage, Delete..."),
  HomeItem(
      name: "Invoice templates", title: "Select templates, change colors..."),
  HomeItem(
      name: "Payment information", title: "Payment options, instructions..."),
  HomeItem(name: "Tax", title: "Tax options"),
  HomeItem(name: "Default notes", title: "Invoice notes, Estimate notes"),
  HomeItem(
      name: "Customization options",
      title: "Invoice no., Quantity label, Invoice title..."),
  HomeItem(name: "Export", title: ""),
  HomeItem(name: "Account settings", title: ""),
  HomeItem(name: "Upgrade  your plan", title: ""),
  HomeItem(
      name: "Country/region settings", title: "Currency, country, language..."),
  HomeItem(name: "Logout", title: ""),
];
