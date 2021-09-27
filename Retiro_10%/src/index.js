const bodyParser = require('body-parser');
const express = require('express');
const app = express();
const path = require('path');

//Configuracion
app.set('port',process.env.PORT || 3000);

//Middleware
app.use(express.json());

//Rutas
app.use(require('./routes/cuentas'));

//Servidor
app.listen(app.get('port'), ()=>{
    console.log('Servidor en puerto',app.get('port'))
});