-- Create a table called **roles** in the database
CREATE TABLE roles (
  id SERIAL NOT NULL,
  role VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Create a table called **permissions** in the database
CREATE TABLE permissions (
  id SERIAL NOT NULL,
  permission VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Create a table called **role_permission** in the database
CREATE TABLE role_permission (
  id SERIAL NOT NULL,
  role_id INT,
  permission_id INT,
  FOREIGN KEY (role_id) REFERENCES roles(id),
  FOREIGN KEY (permission_id) REFERENCES permissions(id),
  PRIMARY KEY (id)
);

-- Create a table called **users** in the database
CREATE TABLE users (
  id SERIAL NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  country VARCHAR(255),
  role_id INT,
  is_deleted SMALLINT DEFAULT 0,
  FOREIGN KEY (role_id) REFERENCES roles(id),
  PRIMARY KEY (id)
);

-- Create a table called **flights** in the database
CREATE TABLE flights (
  id SERIAL NOT NULL,
  flight_number VARCHAR(255) NOT NULL,
  origin VARCHAR(255) NOT NULL,
  destination VARCHAR(255) NOT NULL,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  is_deleted SMALLINT DEFAULT 0,
  PRIMARY KEY (id)
);

-- Create a table called **hotels** in the database
CREATE TABLE hotels (
  id SERIAL NOT NULL,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  price_per_night DECIMAL(10, 2) NOT NULL,
  image_url VARCHAR(255),
  is_deleted SMALLINT DEFAULT 0,
  PRIMARY KEY (id)
);

-- Create a table called **tour_packages** in the database
CREATE TABLE tour_packages (
  id SERIAL NOT NULL,
  name VARCHAR(255) NOT NULL,
  destination VARCHAR(255) NOT NULL,
  duration_days INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  hotel_id INT,
  price DECIMAL(10, 2) NOT NULL,
  description TEXT,
  is_deleted SMALLINT DEFAULT 0,
  FOREIGN KEY (hotel_id) REFERENCES hotels(id),
  PRIMARY KEY (id)
);

-- Create a table called **reservations** in the database
CREATE TABLE reservations (
  id SERIAL NOT NULL,
  user_id INT,
  flight_id INT,
  hotel_id INT,
  tour_package_id INT,
  check_in_date DATE,
  check_out_date DATE,
  total_price DECIMAL(10, 2) NOT NULL,
  reservation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(50) DEFAULT 'Pending',
  is_deleted SMALLINT DEFAULT 0,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (flight_id) REFERENCES flights(id),
  FOREIGN KEY (hotel_id) REFERENCES hotels(id),
  FOREIGN KEY (tour_package_id) REFERENCES tour_packages(id),
  PRIMARY KEY (id)
);

-- Create a table called **notifications** in the database
CREATE TABLE notifications (
  id SERIAL NOT NULL,
  user_id INT,
  message TEXT,
  is_read SMALLINT DEFAULT 0,
  notification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  PRIMARY KEY (id)
);

-- Create a table called **favorites** in the database
CREATE TABLE favorites (
  id SERIAL NOT NULL,
  user_id INT,            
  flight_id INT,          
  hotel_id INT,           
  tour_package_id INT,      
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (flight_id) REFERENCES flights(id) ON DELETE CASCADE,
  FOREIGN KEY (hotel_id) REFERENCES hotels(id) ON DELETE CASCADE,
  FOREIGN KEY (tour_package_id) REFERENCES tour_packages(id) ON DELETE CASCADE
);
