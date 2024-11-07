create database ProyectoFinalDAM
use ProyectoFinalDAM

-- Tabla Vendedor
CREATE TABLE Vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Tabla Venta
CREATE TABLE Venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    id_vendedor INT,
    id_cliente INT,
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla Detalle_Venta (Detalle de productos en cada venta)
CREATE TABLE Detalle_Venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100) NOT NULL,
    telefono_proveedor VARCHAR(15)
);

-- Tabla Producto_Proveedor (Relación muchos a muchos entre Producto y Proveedor)
CREATE TABLE Producto_Proveedor (
    id_producto INT,
    id_proveedor INT,
    fecha_provision DATE,
    PRIMARY KEY (id_producto, id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);
