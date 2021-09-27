const express = require('express');
const conn = require('../database'); //El archivo de coneccion a BD


//ALTER
conn.query('alter table afp modify dir_web varchar(100);',(err, resp, campos) =>{
    console.log(resp)
});
//query para añadir el check a porcentaje y que los valores sean menores o iguales a 10.
conn.query('alter table retiro add check (porcentaje<=10);',(err, resp, campos) =>{
    console.log(resp)
});


//SELECT
conn.query('select primer_nombre, primer_apellido from afiliado;',(err, resp, campos) =>{
    console.log(resp)
});
conn.query('select rut, primer_nombre,primer_apellido as nombre_completo from afiliado join cuenta on afiliado.rut = cuenta.rut_afiliado;',(err, resp, campos) =>{
    console.log(resp)
});
conn.query('select rut, primer_nombre, primer_apellido as nombre_completo from (afiliado join retiro on afiliado.rut = retiro.rut_afiliado) where monto >= 500000;',(err, resp, campos) =>{
    console.log(resp)
});

//UPDATE
conn.query("update afiliado set primer_nombre = 'Daniel' where rut = 20479539;",(err, resp, campos) =>{
    console.log(resp)
});
conn.query("update afiliado set contrasena = 'uno2tres@' where n_documento = 111111;",(err, resp, campos) =>{
    console.log(resp)
});


//INSERT
conn.query("insert into afp values ('Plan Vital', 'afpplanvital@gmail.com','asdasd 123','600 6000 301');",(err, resp, campos) =>{
    console.log(resp)
});
conn.query("insert into direccion values('Av baquedano 1245',20479539);",(err, resp, campos) =>{
    console.log(resp)
});
conn.query("insert into telefono values('97745254',20479539);",(err, resp, campos) =>{
    console.log(resp)
});


//DELETE
conn.query("delete from telefono where rut_afiliado = 20479539;",(err, resp, campos) =>{
    console.log(resp)
});
conn.query("delete from direccion where rut_afiliado = 20479539;",(err, resp, campos) =>{
    console.log(resp)
});

//EJECUTA UNA SOLA VEZ BIEN LAS CONSULTAS, DESPUES QUEDAN ALGUNAS A LA DERIVA POR LA EDICION MISMA DE ALGUNAS CONSULTAS QUE SE EJECUTAN.