package websocket;


import com.google.gson.Gson;
import logical.Main;
import logical.Mensajes;
import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketClose;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketConnect;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketMessage;
import org.eclipse.jetty.websocket.api.annotations.WebSocket;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import static j2html.TagCreator.p;

@WebSocket
public class ManejadorDeMensajes {
    /**
     * Una vez conectado el cliente se activa este metodo.
     * @param usuario
     */
    @OnWebSocketConnect
    public void conectando(Session usuario){
        System.out.println("Conectando Usuario: "+usuario.getLocalAddress().getAddress().toString());
    }

    /**
     * Una vez cerrado la conexión, es ejecutado el metodo anotado
     * @param usuario
     * @param statusCode
     * @param reason
     */
    @OnWebSocketClose
    public void cerrandoConexion(Session usuario, int statusCode, String reason) {
        for(Iterator<Map.Entry<String, Session>> it = Main.usuariosDisponibles.entrySet().iterator(); it.hasNext(); ) {
            Map.Entry<String, Session> entry = it.next();
            if(entry.getValue().equals(usuario)) {
                it.remove();
            }
        }
    }

    /**
     * Una vez recibido un mensaje es llamado el metodo anotado.
     * @param usuario
     * @param message
     */
    @OnWebSocketMessage
    public void recibiendoMensaje(Session usuario, String message) throws IOException {
        Gson gson = new Gson();
        Mensajes mc = gson.fromJson(message, Mensajes.class);

        if (mc.isIniciado()){
            Main.usuariosDisponibles.put(mc.getOrigen(),usuario);
            return;
        }
        Session session = Main.usuariosDisponibles.get(mc.getOrigen());
        if( session != null)
            session.getRemote().sendString(gson.toJson(mc));
        else{
            mc = new Mensajes("Server","Servidor","","El usuario se ha desconectado",false);
            usuario.getRemote().sendString(gson.toJson(mc));
        }
    }
}
