package logical;

public class UsuarioChat {

    private String username;
    private boolean admin;

    public UsuarioChat() {
    }

    public UsuarioChat(String username, boolean admin) {
        this.username = username;
        this.admin = admin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String nombreChat) {
        this.username = nombreChat;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }
}
