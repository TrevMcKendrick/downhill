
ga('require', 'ecommerce', 'ecommerce.js');

ga('ecommerce:addTransaction', {
  'id': '1234',                     // Transaction ID. Required.
  'affiliation': 'trevor',   // Affiliation or store name.
  'revenue': '11.99',               // Grand Total.
  'shipping': '5',                  // Shipping.
  'tax': '1.29'                     // Tax.
});

ga('ecommerce:addItem', {
  'id': '1234',                     // Transaction ID. Required.
  'name': 'VIP Ticket',    // Product name. Required.
  'sku': 'DD23444',                 // SKU/code.
  'category': 'Party Toys',         // Category or variation.
  'price': '10.50',                 // Unit price.
  'quantity': '1'                   // Quantity.
});

ga('ecommerce:send');

ga('send', 'event', 'Party Toys', 'purchase', 'order_page', 4);
