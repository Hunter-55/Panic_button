const path = require('path');
const express = require('express');
const app = express();
const socket = require('socket.io');

app.set('port', process.env.PORT || 3000);

app.use(express.static(path.join(__dirname, 'public')));

const server = app.listen(app.get('port'), () => {
    console.log("iniciado puerto: ", app.get('port'), "");
});
const io = socket(server);


io.on('connection', (socket) => {

    //personas conectadas
    console.log("connected: ", socket.id, " :", socket.address);

    //cordenadas
    socket.on('latlng',function(latitude, logitude, nombreusuario){
        io.emit("coords",latitude, logitude, nombreusuario);
    });

    //alerta
    socket.on('alert',function(latitude,
        logitude,
        nombre,
        paterno,
        materno,
        direccion,
        sexo,
        edad,
        fecha,
        telefono,
        correo){
            io.emit("alertuser",latitude,
            logitude,
            nombre,
            paterno,
            materno,
            direccion,
            sexo,
            edad,
            fecha,
            telefono,
            correo);
    });
   
/******************** [ socket desconnect ] ***********************/
    socket.on('disconnect', function() {
        console.log("############# usuarios desconectaods ###########");
        console.log(' has disconnected ' + socket.id);
    });//cierre de "disconnect"

});//cierre de conexion socket