// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
{
product_id: "E001",
product_name: "Smartphone",
category: "Electronics",
price: 25000,
brand: "Samsung",
warranty_years: 2,
specifications: {
battery: "5000mAh",
voltage: "220V",
ram: "8GB"
}
},
{
product_id: "C001",
product_name: "T-Shirt",
category: "Clothing",
price: 800,
brand: "Nike",
size: ["S", "M", "L", "XL"],
material: "Cotton",
color: "Black"
},
{
product_id: "G001",
product_name: "Milk",
category: "Groceries",
price: 60,
brand: "Amul",
expiry_date: ISODate("2026-03-25"),
weight: "500ml",
nutrition: {
calories: 150,
protein: "8g",
fat: "5g"
}
}
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
category: "Electronics",
price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
category: "Groceries",
expiry_date: { $lt: ISODate("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
{ product_id: "E001" },
{ $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field
db.products.createIndex({ category: 1 });

// This index improves query performance when filtering by category,
// which is frequently used in queries like OP2 and OP3.
