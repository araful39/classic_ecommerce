

class DeliveredDetailsData{


  static Map data = {
    "status": "success",
    "message": "Delivered order details fetched successfully",
    "delivery_view": {
      "order_no": "ORD123456",
      "order_date": "2024-08-01",
      "user_name": "John Doe",
      "shipping_name": "John Doe",
      "shipping_email": "johndoe@example.com",
      "shipping_phone": "+1234567890",
      "shipping_address": "123 Main St, City, Country",
      "product_data": [
        {
          "product_name": "Product A",
          "quantity": 2,
          "price": 50,
          "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/product/240523-PMXZVT.png"
        },
        {
          "product_name": "Product B",
          "quantity": 3,
          "price": 30,
          "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/product/240523-PMXZVT.png"
        }
      ],
      "payment_method": "Credit Card",
      "total_amount": "100",
      "delivery_charge": "5",
      "status": "Delivered"
    }
  };
}