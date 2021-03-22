--- creation d'une table 'customers'
CREATE TABLE customers(
    ---cus_id sera la clé primaire de la table 
   cus_id COUNTER,
--- ici tout les renseignements du clients devront etre mis
   cus_firstname VARCHAR(50) NOT NULL,
--- avec un caractere maximum 
   cus_lastname VARCHAR(50) NOT NULL,
   cus_mail VARCHAR(70) NOT NULL,
   cus_address VARCHAR(50) NOT NULL,
   cus_phone_number INT NOT NULL,
   cus_city VARCHAR(50) NOT NULL,
   cus_password VARCHAR(50),
   cus_add_date DATE NOT NULL,
   cus_update_date DATE NOT NULL,
   PRIMARY KEY(cus_id),
--- propriété du mail sera unique ainsi que sont mots de passe
   UNIQUE(cus_mail),
   UNIQUE(cus_password)
);

CREATE TABLE suppliers(
--- sup_id sera la clé primaire de la table mis avec un COUNTER permettra d'avoir une clé primaire unique
   sup_id COUNTER,
   sup_name VARCHAR(50) NOT NULL,
   sup_phone_number VARCHAR(15) NOT NULL,
   sup_mail VARCHAR(50) NOT NULL,
   sup_address DOUBLE NOT NULL,
--- ici on nous montre bien que la clé primaire est bien sup_id dans cette table
   PRIMARY KEY(sup_id)
);

CREATE TABLE categories(
   cat_id COUNTER,
   cat_name VARCHAR(50) NOT NULL,
   PRIMARY KEY(cat_id)
);

CREATE TABLE orders(
   ode_id COUNTER,
--- cette ligne nous montre le type numerique DECIMAL donc un maximum de 7 chiffres dont apres la virgule
   ode_payment DECIMAL(7,2) NOT NULL,
--- ici une date a ete inserer donc jai du mettre un type date
   ode_delivery_date DATETIME NOT NULL,
   ode_ship_date DATE NOT NULL,
   cus_id INT NOT NULL,
   PRIMARY KEY(ode_id),
--- la liaison des deux tables a permis d'inserer une clé étrangère  dans la table
   FOREIGN KEY(cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE post(
   post_id COUNTER,
   post_label VARCHAR(50) NOT NULL,
   PRIMARY KEY(post_id)
);

CREATE TABLE shop(
   shop_id COUNTER,
   shop_name VARCHAR(50) NOT NULL,
   PRIMARY KEY(shop_id)
);

CREATE TABLE department(
   dep_id COUNTER,
   dep_name VARCHAR(50) NOT NULL,
   PRIMARY KEY(dep_id)
);

CREATE TABLE products(
   pro_id COUNTER,
   pro_price DECIMAL(7,2) NOT NULL,
   pro_internal_reference CHAR(6),
   pro_bar_code VARCHAR(13),
   pro_physical_stock INT NOT NULL,
   pro_alert_stock INT NOT NULL,
   pro_label VARCHAR(50) NOT NULL,
   pro_description TEXT NOT NULL,
   pro_add_dates DATE NOT NULL,
   pro_update_date DATE NOT NULL,
   pro_photo VARCHAR(255) NOT NULL,
   pro_is_sale LOGICAL NOT NULL,
   cat_id INT NOT NULL,
   sup_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   UNIQUE(pro_internal_reference),
   UNIQUE(pro_bar_code),
   FOREIGN KEY(cat_id) REFERENCES categories(cat_id),
   FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)
);

CREATE TABLE employees(
   emp_id COUNTER,
   emp_city VARCHAR(50) NOT NULL,
   emp_firstname VARCHAR(50) NOT NULL,
   emp_lastname VARCHAR(50) NOT NULL,
   emp_mail VARCHAR(50) NOT NULL,
   emp_address VARCHAR(50) NOT NULL,
   emp_phone_number VARCHAR(15) NOT NULL,
   emp_gender CHAR(1) NOT NULL,
   emp_children BYTE NOT NULL,
   emp_salary CURRENCY NOT NULL,
   dep_id INT NOT NULL,
   shop_id INT NOT NULL,
   post_id INT NOT NULL,
   PRIMARY KEY(emp_id),
   UNIQUE(emp_mail),
   FOREIGN KEY(dep_id) REFERENCES department(dep_id),
   FOREIGN KEY(shop_id) REFERENCES shop(shop_id),
   FOREIGN KEY(post_id) REFERENCES post(post_id)
);

CREATE TABLE orders_details(
   ord_id COUNTER,
   ord_discount DECIMAL(5,2),
   ord_quantity INT NOT NULL,
   ord_unit_price DECIMAL(7,2) NOT NULL,
   ode_id INT NOT NULL,
   pro_id INT NOT NULL,
   PRIMARY KEY(ord_id),
   FOREIGN KEY(ode_id) REFERENCES orders(ode_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id)
);
