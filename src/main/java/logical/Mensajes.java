package logical;

public class Mensajes {
    private String origen;
    private String nombreOrigen;
    private String destinatario;
    private String mensaje;
    private boolean iniciado;
    private boolean finalizado;

    public Mensajes() {
    }

    public Mensajes(String origen, String nombreOrigen, String destinatario, String mensaje, boolean iniciado) {
        this.origen = origen;
        this.nombreOrigen = nombreOrigen;
        this.destinatario = destinatario;
        this.mensaje = mensaje;
        this.iniciado = iniciado;
        this.finalizado = false;
    }

    public String getOrigen() {
        return origen;
    }

    public String getNombreOrigen() {
        return nombreOrigen;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public String getMensaje() {
        return mensaje;
    }

    public boolean isIniciado() {
        return iniciado;
    }

    public boolean isFinalizado() {
        return finalizado;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public void setIniciado(boolean iniciado) {
        this.iniciado = iniciado;
    }

    public void setFinalizado(boolean finalizado) {
        this.finalizado = finalizado;
    }

    public void setNombreOrigen(String nombreOrigen) {
        this.nombreOrigen = nombreOrigen;
    }
}
