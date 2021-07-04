CREATE database rbac CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
use rbac;

CREATE TABLE operations (
    operation_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(64) NOT NULL UNIQUE
);
CREATE TABLE resources (
    resource_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(64) NOT NULL UNIQUE
);

CREATE TABLE permissions (
    permission_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    operation_id SMALLINT UNSIGNED NOT NULL,
    resource_id SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_permission_operation FOREIGN KEY (operation_id)
        REFERENCES operations (operation_id),
    CONSTRAINT fk_permission_resource FOREIGN KEY (resource_id)
        REFERENCES resources (resource_id),
	UNIQUE KEY id_operation_resource (operation_id, resource_id)
);

CREATE TABLE roles (
    role_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    inherit_from SMALLINT UNSIGNED,
    CONSTRAINT fk_roles_roles FOREIGN KEY (inherit_from)
        REFERENCES roles (role_id)
);

CREATE TABLE role_permission (
    role_id SMALLINT UNSIGNED NOT NULL,
    permission_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (role_id , permission_id),
    CONSTRAINT fk_role_permission_role FOREIGN KEY (role_id)
        REFERENCES roles (role_id),
    CONSTRAINT fk_role_permission_permission FOREIGN KEY (permission_id)
        REFERENCES permissions (permission_id)
);

CREATE TABLE subjects (
	subject_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(256) UNIQUE NOT NULL,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    phone_number VARCHAR(10)
);

CREATE TABLE subject_role (
    subject_id SMALLINT UNSIGNED NOT NULL,
    role_id SMALLINT UNSIGNED NOT NULL,
	start_date DATETIME,
    end_date DATETIME,
    PRIMARY KEY (subject_id, role_id),
    CONSTRAINT fk_subject_role_subject FOREIGN KEY (subject_id)
        REFERENCES subjects (subject_id),
    CONSTRAINT fk_subject_role_role FOREIGN KEY (role_id)
        REFERENCES roles (role_id)
);

CREATE INDEX idx_first_last_name
ON subjects
(first_name, last_name);