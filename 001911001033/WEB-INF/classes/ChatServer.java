import java.io.IOException;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.PathParam;
import java.util.*;

@ServerEndpoint(value = "/chat/{name}")
public class ChatServer {
    static final List<ChatServer> handlers = new ArrayList<>();
    private String name;
    private Session session;

    @OnOpen
    public void onOpen(@PathParam("name") String name, Session session) {
        this.session = session;
        this.name = name;
        handlers.add(this);
        sendToClients(name + " joined");
        System.out.println(name);
    }

    @OnClose
    public void onClose() {
        handlers.remove(this);
        sendToClients(name + " has left");
    }

    @OnMessage
    public void onMessage(String msg) {
        sendToClients(name + ": " + msg);
    }

    private static void sendToClients(String msg) {
        for (ChatServer handler : handlers) {
            try {
                synchronized (handler) {
                    handler.session.getBasicRemote().sendText(msg);
                }
            } catch (IOException e) {
                handlers.remove(handler);
                try {
                    handler.session.close();
                } catch (IOException e1) {
                }
                sendToClients(handler.name + " has discontinued.");
            }
        }
    }
}