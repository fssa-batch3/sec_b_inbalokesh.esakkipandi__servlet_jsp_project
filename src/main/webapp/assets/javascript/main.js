const products = JSON.parse(localStorage.getItem("product_list"));

const show_products = JSON.parse(localStorage.getItem("product_ids"));

if (!products) {
  localStorage.setItem(
    "product_list",
    JSON.stringify(
      [
        { "product_image": "https://iili.io/HN4V3MX.webp", "product_name": "Sambar Rice", "product_type": "Veg", "product_quantity": "250", "quantity_type": "g", "product_price": "25", "product_id": "6c21b6e8-27ef-4401-936d-38790f6b7845" },
        { "product_image": "https://iili.io/HMe272t.webp", "product_name": "Chicken 65", "product_type": "Non-Veg", "product_quantity": "250", "quantity_type": "g", "product_price": "63", "product_id": "2c5d0f02-5449-4e65-ad3e-c719ebfab4c5" },
        { "product_image": "https://iili.io/HMeJ2uj.jpg", "product_name": "Pongal", "product_type": "Veg", "product_quantity": "200", "quantity_type": "g", "product_price": "30", "product_id": "8f308f4f-daa9-420d-82fb-bfc2d3cf0d06" },
        { "product_image": "https://iili.io/HgW5e7S.md.jpg", "product_name": "Chapathi with Chana", "product_type": "Veg", "product_quantity": "3", "quantity_type": "Chapathi", "product_price": "29", "product_id": "1130bcc7-d69a-4ad8-88f8-d89375f9dba9" },
        { "product_image": "https://iili.io/HgW5s2V.md.jpg", "product_name": "Curd Rice", "product_type": "Veg", "product_quantity": "250", "quantity_type": "g", "product_price": "29", "product_id": "68beb2e2-d9a4-4cf3-a336-f5009f727d63" },
        { "product_image": "https://iili.io/HgW72YN.md.jpg", "product_name": "Ghee Rice with Panner", "product_type": "Veg", "product_quantity": "500", "quantity_type": "g", "product_price": "89", "product_id": "e50df104-8c88-4024-b422-365beda3a93d" },
        { "product_image": "https://iili.io/HgW75u9.md.jpg", "product_name": "Poratta", "product_type": "Veg", "product_quantity": "2", "quantity_type": "piece", "product_price": "19", "product_id": "420bcfb1-b057-4759-89e7-61e1ba1e64e4" },
        { "product_image": "https://iili.io/HgW7hwF.md.jpg", "product_name": "Idly", "product_type": "Veg", "product_quantity": "4", "quantity_type": "pieces", "product_price": "24", "product_id": "5afcf9f5-c28f-4bc0-b53e-b8e2f560af25" },
        { "product_image": "https://iili.io/HgW7pA7.jpg", "product_name": "Ice Biryani", "product_type": "Veg", "product_quantity": "500", "quantity_type": "g", "product_price": "69", "product_id": "be37d3ea-fd4c-4347-a406-698842315a6f" },
        { "product_image": "https://iili.io/HgWYFKx.md.jpg", "product_name": "Poori", "product_type": "Veg", "product_quantity": "3", "quantity_type": "pieces", "product_price": "34", "product_id": "a90f71c8-f789-4005-a448-73acc4477416" },
        { "product_image": "https://iili.io/HgWYAKv.md.jpg", "product_name": "Ragi Koozh", "product_type": "Veg", "product_quantity": "200", "quantity_type": "g", "product_price": "39", "product_id": "48b32866-bd14-4560-a4c7-86d3136b2f6a" },
        { "product_image": "https://iili.io/HgWYcNt.md.jpg", "product_name": "Dosa Ghee Roast", "product_type": "Veg", "product_quantity": "1", "quantity_type": "Dosa", "product_price": "49", "product_id": "cfb2b834-0ba0-4e1d-bc0c-6e59993588b2" },
        { "product_image": "https://iili.io/HgWcnCg.md.jpg", "product_name": "Chicken Biryani", "product_type": "Non-veg", "product_quantity": "1", "quantity_type": "Kg", "product_price": "99", "product_id": "55f54b8c-edbb-4af1-b85c-b0b6a0a12b9d" },
        { "product_image": "https://iili.io/HgWljJR.md.jpg", "product_name": "Upma", "product_type": "Veg", "product_quantity": "250", "quantity_type": "g", "product_price": "19", "product_id": "930a2f14-4822-4dd4-b42a-4bf2e90a4f68" },
        { "product_image": "https://iili.io/HgW0x7R.md.jpg", "product_name": "Veg Biryani", "product_type": "Veg", "product_quantity": "1", "quantity_type": "Kg", "product_price": "79", "product_id": "c1aec0d5-7ede-4184-bb4f-8af9fff183f4" },
        { "product_image": "https://iili.io/HgW0Ep2.md.jpg", "product_name": "Mutton Biryani", "product_type": "Non-veg", "product_quantity": "1", "quantity_type": "kg", "product_price": "149", "product_id": "d20dc3a6-e43b-4b62-b8a4-7ebec1a61874" }
      ]
    ));
}

if (!show_products) {
  localStorage.setItem(
    "product_ids",
    JSON.stringify(
      [
        { "product_id": "2c5d0f02-5449-4e65-ad3e-c719ebfab4c5" },
        { "product_id": "8f308f4f-daa9-420d-82fb-bfc2d3cf0d06" },
        { "product_id": "6c21b6e8-27ef-4401-936d-38790f6b7845" },
        { "product_id": "1130bcc7-d69a-4ad8-88f8-d89375f9dba9" },
        { "product_id": "68beb2e2-d9a4-4cf3-a336-f5009f727d63" },
        { "product_id": "e50df104-8c88-4024-b422-365beda3a93d" },
        { "product_id": "420bcfb1-b057-4759-89e7-61e1ba1e64e4" },
        { "product_id": "5afcf9f5-c28f-4bc0-b53e-b8e2f560af25" },
        { "product_id": "be37d3ea-fd4c-4347-a406-698842315a6f" },
        { "product_id": "a90f71c8-f789-4005-a448-73acc4477416" },
        { "product_id": "48b32866-bd14-4560-a4c7-86d3136b2f6a" },
        { "product_id": "cfb2b834-0ba0-4e1d-bc0c-6e59993588b2" },
        { "product_id": "55f54b8c-edbb-4af1-b85c-b0b6a0a12b9d" },
        { "product_id": "930a2f14-4822-4dd4-b42a-4bf2e90a4f68" },
        { "product_id": "c1aec0d5-7ede-4184-bb4f-8af9fff183f4" },
        { "product_id": "d20dc3a6-e43b-4b62-b8a4-7ebec1a61874" }
      ]
    )
  );
}
