// Demo Data
class CategoryList {
  static Map<String, dynamic> categoryList = {
    "categories": [
      {
        "category_id": 9,
        "category_name": {"en": "Clothing"},
        "category_image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-PVK48K.jpeg",
        "sub_categories_list": [
          {
            "sub_category_id": 16,
            "sub_categories": {"en": "Men"},
            "child_categories_list": [
              {
                "child_category_id": 20,
                "child_category_name": {"en": "Shirt"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-R8ZOZ1.webp"
              },
              {
                "child_category_id": 21,
                "child_category_name": {"en": "Pant"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-ZPLGMJ.webp"
              }
            ]
          },
          {
            "sub_category_id": 17,
            "sub_categories": {"en": "Women"},
            "child_categories_list": [
              {
                "child_category_id": 18,
                "child_category_name": {"en": "Gown"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-KIADTY.jpg"
              },
              {
                "child_category_id": 19,
                "child_category_name": {"en": "Salwar Kameez"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-1TL5B5.jpg"
              }
            ]
          }
        ]
      },
      {
        "category_id": 8,
        "category_name": {"en": "Electronics"},
        "category_image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-FERBVG.jpg",
        "sub_categories_list": [
          {
            "sub_category_id": 10,
            "sub_categories": {"en": "Phones"},
            "child_categories_list": [
              {
                "child_category_id": 11,
                "child_category_name": {"en": "Mobile Phones"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-XETDF2.jpg"
              },
              {
                "child_category_id": 12,
                "child_category_name": {"en": "Tabs"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-646LXQ.webp"
              }
            ]
          },
          {
            "sub_category_id": 13,
            "sub_categories": {"en": "Computer"},
            "child_categories_list": [
              {
                "child_category_id": 14,
                "child_category_name": {"en": "Desktop"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-YFL85K.webp"
              },
              {
                "child_category_id": 15,
                "child_category_name": {"en": "Laptop"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-T58J3Q.jpg"
              }
            ]
          }
        ]
      },
      {
        "category_id": 1,
        "category_name": {"en": "Home Appliances"},
        "category_image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-OEOJMZ.png",
        "sub_categories_list": [
          {
            "sub_category_id": 2,
            "sub_categories": {"en": "Foods"},
            "child_categories_list": [
              {
                "child_category_id": 3,
                "child_category_name": {"en": "Meat"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-UVH1FK.jpg"
              },
              {
                "child_category_id": 4,
                "child_category_name": {"en": "Drinks"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-69CSVX.png"
              }
            ]
          },
          {
            "sub_category_id": 5,
            "sub_categories": {"en": "Kitchen Tools"},
            "child_categories_list": [
              {
                "child_category_id": 6,
                "child_category_name": {"en": "Cleaning"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-Z5QWRU.webp"
              },
              {
                "child_category_id": 7,
                "child_category_name": {"en": "Cooking"},
                "image": "https://cit-ecommerce-codecanyon.bandhantrade.com/images/categories/240523-U8XCIE.webp"
              }
            ]
          }
        ]
      },
      {
        "category_id": 1,
        "category_name": {"en": "Grocery Shop"},
        "category_image": "https://img1.10bestmedia.com/Images/Photos/406808/The-Fresh-Market_55_660x440.jpg",
        "sub_categories_list": [
          {
            "sub_category_id": 2,
            "sub_categories": {"en": "Foods"},
            "child_categories_list": [
              {
                "child_category_id": 3,
                "child_category_name": {"en": "snacks"},
                "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_-_5sElYZjSup9W4EIs-JbhNXgGxj0Uq-UA&s"
              },
              {
                "child_category_id": 4,
                "child_category_name": {"en": "Biscuits Pack"},
                "image": "https://m.media-amazon.com/images/I/81yCjPEt9jL._AC_UF1000,1000_QL80_.jpg"
              }
            ]
          },
        ]
      }
    ]
  };




  static Map<String, dynamic> categoryNameList = {
    "status": "success",
    "message": "Main Category Level 0 Data Retrieved Successfully!",
    "main_category": [
      {
        "category_id": 100,
        "category_name": "Grocery"
      },
      {
        "category_id": 1,
        "category_name": "Home Appliances"
      },
      {
        "category_id": 8,
        "category_name": "Electronics"
      },
      {
        "category_id": 9,
        "category_name": "Clothing"
      }
    ]
  };
}
