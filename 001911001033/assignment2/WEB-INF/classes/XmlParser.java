import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlParser {
    private String file_path;
    public void XmlParser(String file_path){
        file_path = file_path;
    }

    public void store_into_database(String url, String table_name){
        
    }
    public static void main(String[] args) {
        try {
            File file = new File("./questions.xml");
            DocumentBuilder documentBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            Document document = documentBuilder.parse(file);
            
            process_questions(document.getChildNodes().item(1).getChildNodes());
        
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private static void process_questions(NodeList question_list){
        for(int i=0; i < question_list.getLength(); i++){

            if(question_list.item(i).getNodeType() == Node.ELEMENT_NODE ){ //This is a question
                Node question = question_list.item(i);
                Node number = question.getAttributes().item(0);

                System.out.println(question.getNodeName()+" #"+number.getNodeValue()+"=>");
                NodeList children = question.getChildNodes();

                for(int j=0; j<children.getLength();j++){
                    if(children.item(j).getNodeType() == Node.ELEMENT_NODE){
                        if(children.item(j).getNodeName()=="answer"){
                            Node value = children.item(j).getAttributes().item(0);
                            System.out.println(children.item(j).getNodeName()+": "+value.getNodeValue());
                        }
                        else{
                            System.out.println(children.item(j).getNodeName()+": "+children.item(j).getTextContent());
                        }
                    }
                }
            }
            
        }
    }
}