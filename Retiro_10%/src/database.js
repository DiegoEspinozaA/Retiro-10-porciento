const mysql = require('mysql');

const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'retiro10'
    //port: 3330
});

conn.connect(function (err){
    if(err){
        console.log(err);
        return;
    }
    else{
        console.log('La base de datos se conecto')
    }
});

module.exports = conn;