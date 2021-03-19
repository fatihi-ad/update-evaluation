                        ---Roles---

CREATE USER 'marketing'@'localhost'
-- Création de l'utilisateur "marketing"
GRANT SELECT, INSERT, UPDATE, DELETE ON products TO marketing 
GRANT SELECT, INSERT, UPDATE, DELETE ON categories TO marketing 
GRANT SELECT, INSERT, UPDATE, DELETE ON orders_details TO marketing 
GRANT SELECT, INSERT, UPDATE, DELETE ON orders TO marketing 
GRANT SELECT, INSERT, UPDATE, DELETE ON customers  TO marketing 
-- Attribution des privilèges pour ajouter, modifier et supprimer des produits et des catégories dans les tables products, categories, orders_details, orders et customers
