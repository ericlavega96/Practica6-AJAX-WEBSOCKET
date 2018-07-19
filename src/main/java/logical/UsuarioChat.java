package logical;

public class UsuarioChat {

    private String nombreChat;
    private boolean admin;

    public UsuarioChat() {
    }

    public UsuarioChat(String nombreChat, boolean admin) {
        this.nombreChat = nombreChat;
        this.admin = admin;
    }

    public String getNombreChat() {
        return nombreChat;
    }

    public void setNombreChat(String nombreChat) {
        this.nombreChat = nombreChat;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }
}
