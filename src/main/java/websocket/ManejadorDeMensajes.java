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
        System.out.println("Desconectando el usuario: "+usuario.getLocalAddress().getAddress().toString());
        for(Iterator<Map.Entry<String, Session>> it = Main.usuariosConectados.entrySet().iterator(); it.hasNext(); ) {
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
        System.out.println("Recibiendo del cliente: " + usuario.getLocalAddress().getAddress().toString() + " - Mensaje" + message);
        Gson gson = new Gson();
        Mensajes mc = gson.fromJson(message, Mensajes.class);

        if (mc.isIniciado()) {
            Main.usuariosConectados.put(mc.getOrigen(), usuario);
            return;
        }
        Session session = Main.usuariosConectados.get(mc.getDestinatario());
        if (session != null)
            session.getRemote().sendString(gson.toJson(mc));
        else {
            mc = new Mensajes("server", "", "Servidor", "EL USUARIO ACABA DE DESCONECTARSE...", false);
            usuario.getRemote().sendString(gson.toJson(mc));
        }
    }
}
