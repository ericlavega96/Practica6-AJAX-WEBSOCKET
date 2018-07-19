$(document).ready(function () {
    console.log("asdff");
    var webSocket = new WebSocket("ws://" + location.hostname + ":" + location.port + "/mensajeServidor");

    webSocket.onopen  = function(e){
        var info = get_info(true);
        console.log(info.nombreOrigen);
        webSocket.send(JSON.stringify(info));
    };

    webSocket.onmessage  = function(msg){
        var data = JSON.parse(msg.data);
        console.log('chat_window_'+msg.nombreOrigen);
        if(document.getElementById('chat_window_'+data.nombreOrigen)==null){
            inyectarChat(data);
        }

        inyectarHtml(data);
    };
    
    webSocket.onclose = function (msg) {
        
    }

    function inyectarHtml(mensaje) {
        var html = '<div class="row msg_container base_sent">';
        html+=    '<div class="col-md-10 col-xs-10 ">';
        html+=    '<div class="messages msg_sent">';
        html+=    '<p><b>'+ mensaje.nombreOrigen +' dice:</b></p><p>' + mensaje.mensaje + '</p>';
        html+=     '</div> </div> </div>';
        var div = document.createElement('div');
        div.innerHTML = html;
        document.getElementById("chat_panel_"+mensaje.nombreOrigen).appendChild(div);

    }

    function inyectarSelf(mensaje) {
        var html = '<div class="row msg_container base_sent">';
        html+=    '<div class="col-md-10 col-xs-10 ">';
        html+=    '<div class="messages msg_sent">';
        html+=    '<p><b>'+ mensaje.nombre_origen +' dice:</b></p><p>' + mensaje.mensaje + '</p>';
        html+=     '</div> </div> </div>';
        var div = document.createElement('div');
        div.innerHTML = html;
        document.getElementById("chat_panel_"+mensaje.destinatario).appendChild(div);

    }



    function inyectarChat(mensaje){
        var html = '<div class="row  col-xs-11 col-md-11" id="chat_window_'+mensaje.nombreOrigen+'" style="margin-top:20px;margin-left:5%" >'
            +'<div class="col-xs-12 col-md-12">'
            +'<div class=" panel panel-default">'
            +'<div class="panel-heading top-bar">'
            +'<div class="col-md-8 col-xs-8">'
            +'<h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span> '+mensaje.nombreOrigen+'</h3>'
            +'</div>'
            +'<div class="col-md-4 col-xs-4" style="text-align: right;"> <a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_'+mensaje.nombreOrigen+'"></span></a> </div></div>'
            +'<div class="panel-body  msg_container_base">'
            +'<div id="chat_panel_'+mensaje.nombreOrigen+'"></div>'
            +'</div></div>'
            +'<div class="panel-footer">'
            +'<div class="input-group">'
            +'<input id="btn-input-'+mensaje.nombreOrigen+'" type="text" class="form-control input-sm chat_input" placeholder="Escriba su mensaje..." />'
            +'<span class="input-group-btn">'
            +'<button class="btn btn-primary btn-sm" id="send-msg-'+mensaje.nombreOrigen+'" value="'+mensaje.nombreOrigen+'">Enviar</button>'
            +'</span></div></div></div></div>';

        var div = document.createElement('div');
        div.innerHTML = html;
        document.getElementById("body").appendChild(div);
        $("#send-msg-"+mensaje.nombreOrigen).click(function(){
            var destinatario = $(this).attr("value")
            var info = {
                inicializando: false,
                nombreOrigen:$("#usuario").val(),
                destinatario: destinatario,
                mensaje: $("#btn-input-"+destinatario).val(),
                nombre_origen: $("#nombre").val()
                
            };
            console.log(info);
            webSocket.send(JSON.stringify(info));
            inyectarSelf(info);
            $("#btn-input-"+destinatario).val("");
        });
    }

});

function get_info (inicializando) {
    var info = {
        inicializando: inicializando,
        nombreOrigen:$("#usuario").val(),
        destinatario: $("#destinatario").val(),
        mensaje: "Probando"
    };
    return info
}