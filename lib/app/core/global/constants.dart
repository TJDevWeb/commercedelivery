enum SessionStorageKeys {
  accessToken('/ACCESS_TOKEN/'),
  shoppingBag('/SHOPPING_BAG/');

  final String key;
  const SessionStorageKeys(this.key);
}