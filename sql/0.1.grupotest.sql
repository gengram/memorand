use memorand;

insert into usuarios values ('Q2sW4dE7fR6gT1y','alumno1@gmail.com','n0m3l0','alumno','Nicolás','Juarez','Barrios','si');
insert into usuarios values ('fR7gT2hY5jU8bS6','alumno2@gmail.com','n0m3l0','alumno','Saul','Zuniga','Aguilar','si');
insert into usuarios values ('K3lM9qA2wS4eD7f','alumno3@gmail.com','n0m3l0','alumno','Christopher','Sandoval','Coxca','si');
insert into usuarios values ('J8kL5oP1iZ3xV6c','alumno4@gmail.com','n0m3l0','alumno','Dylan','Martinez','Castillo','si');
insert into usuarios values ('9bX8cV6dF5gH7jU','alumno5@gmail.com','n0m3l0','alumno','Alumno','Paterno','Materno','si');

insert into instituciones values ('kL5oP1iZ3xV6cN8','Escuela','Escolar','20','2000','30','50');

insert into sectores values ('X8cV6dF5gH7jU9b','Sistemas Distribuidos');
insert into sectores values ('iJ8kL3mN9qA2wS4','Laboratorio de Proyectos');
insert into sectores values ('Y4jU7gE5wS1dF6h','Ingeniería de Pruebas');

insert into instsector values ('kL5oP1iZ3xV6cN8','X8cV6dF5gH7jU9b');
insert into instsector values ('kL5oP1iZ3xV6cN8','iJ8kL3mN9qA2wS4');
insert into instsector values ('kL5oP1iZ3xV6cN8','Y4jU7gE5wS1dF6h');

insert into grupos values ('oP9iL8uY7hG6jK5R','5IM9');

insert into instgrupos values ('kL5oP1iZ3xV6cN8','oP9iL8uY7hG6jK5R');

insert into pertenecen values ('sA3qZ4wE5xT6cV7B','kL5oP1iZ3xV6cN8','Q2sW4dE7fR6gT1y');
insert into pertenecen values ('dF2gH3jK4lM5nP6','kL5oP1iZ3xV6cN8','fR7gT2hY5jU8bS6');
insert into pertenecen values ('vC7bX8mZ9nL1kQ2','kL5oP1iZ3xV6cN8','K3lM9qA2wS4eD7f');
insert into pertenecen values ('iJ5hG4fD3sA2dS6','kL5oP1iZ3xV6cN8','J8kL5oP1iZ3xV6c');
insert into pertenecen values ('pO9iL8uY7hG6jK5','kL5oP1iZ3xV6cN8','9bX8cV6dF5gH7jU');
insert into pertenecen values ('qZ4wE5xT6cV7bX8','kL5oP1iZ3xV6cN8','hY4jU7gE5wS1dF6');
insert into pertenecen values ('gH3jK4lM5nP6oQ9','kL5oP1iZ3xV6cN8','C8lK3oP7iZ9xV6m');
insert into pertenecen values ('C7bX8mZ9nL1kQ2v','kL5oP1iZ3xV6cN8','sW4dE7fR6gT1yH2');

insert into inscriben values ('O9iL8uY7hG6jK5i','sA3qZ4wE5xT6cV7B','oP9iL8uY7hG6jK5R');
insert into inscriben values ('Z4wE5xT6cV7bX8q','dF2gH3jK4lM5nP6','oP9iL8uY7hG6jK5R');
insert into inscriben values ('H3jK4lM5nP6oQ9g','vC7bX8mZ9nL1kQ2','oP9iL8uY7hG6jK5R');
insert into inscriben values ('7bX8mZ9nL1kQ2vC','iJ5hG4fD3sA2dS6','oP9iL8uY7hG6jK5R');
insert into inscriben values ('5hG4fD3sA2dF6iJ','pO9iL8uY7hG6jK5','oP9iL8uY7hG6jK5R');
insert into inscriben values ('9iL8uY7hG6jK5iO','qZ4wE5xT6cV7bX8','oP9iL8uY7hG6jK5R');
insert into inscriben values ('4wE5xT6cV7bX8qZ','gH3jK4lM5nP6oQ9','oP9iL8uY7hG6jK5R');
insert into inscriben values ('3jK4lM5nP6oQ9gH','C7bX8mZ9nL1kQ2v','oP9iL8uY7hG6jK5R');

insert into tienen values ('hG4fD3sA2dF6iJ5','O9iL8uY7hG6jK5i','X8cV6dF5gH7jU9b');
insert into tienen values ('iL8uY7hG6jK5iO9','O9iL8uY7hG6jK5i','iJ8kL3mN9qA2wS4');
insert into tienen values ('wE5xT6cV7bX8qZ4','O9iL8uY7hG6jK5i','Y4jU7gE5wS1dF6h');

insert into tienen values ('jK4lM5nP6oQ9gH3','Z4wE5xT6cV7bX8q','X8cV6dF5gH7jU9b');
insert into tienen values ('X8mZ9nL1kQ2vCc7','Z4wE5xT6cV7bX8q','iJ8kL3mN9qA2wS4');
insert into tienen values ('G4fD3sA2dF6iJ5h','Z4wE5xT6cV7bX8q','Y4jU7gE5wS1dF6h');

insert into tienen values ('L8uY7hG6jK5iO9i','H3jK4lM5nP6oQ9g','X8cV6dF5gH7jU9b');
insert into tienen values ('E5xT6cV7bX8qZ4w','H3jK4lM5nP6oQ9g','iJ8kL3mN9qA2wS4');
insert into tienen values ('K4lM5nP6oQ9gH3j','H3jK4lM5nP6oQ9g','Y4jU7gE5wS1dF6h');

insert into tienen values ('8mZ9nL1kQ2vCc7b','7bX8mZ9nL1kQ2vC','X8cV6dF5gH7jU9b');
insert into tienen values ('4fD3sA2dF6iJ5hG','7bX8mZ9nL1kQ2vC','iJ8kL3mN9qA2wS4');
insert into tienen values ('uY7hG6jK5iO9iL8','7bX8mZ9nL1kQ2vC','Y4jU7gE5wS1dF6h');

insert into tienen values ('5xT6cV7bX8qZ4wE','5hG4fD3sA2dF6iJ','X8cV6dF5gH7jU9b');
insert into tienen values ('4lM5nP6oQ9gH3jK','5hG4fD3sA2dF6iJ','iJ8kL3mN9qA2wS4');
insert into tienen values ('mZ9nL1kQ2vCc7bX','5hG4fD3sA2dF6iJ','Y4jU7gE5wS1dF6h');

insert into tienen values ('fD3sA2dF6iJ5hG4','9iL8uY7hG6jK5iO','X8cV6dF5gH7jU9b');

insert into tienen values ('Y7hG6jK5iO9iL8u','4wE5xT6cV7bX8qZ','iJ8kL3mN9qA2wS4');

insert into tienen values ('xT6cV7bX8qZ4wE5','3jK4lM5nP6oQ9gH','Y4jU7gE5wS1dF6h');

