
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ObjectToJSON<T>{
    private void run(T object) {
        ObjectMapper mapper = new ObjectMapper();
        
        try {
            // Convert object to JSON string and save into a file directly

            String clase = object.getClass().toString();
            mapper.writeValue(new File("D:\\" + clase + ".json"), object);

            // Convert object to JSON string
            String jsonInString = mapper.writeValueAsString(object);
            System.out.println(jsonInString);

            // Convert object to JSON string and pretty print
            jsonInString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(object);
            System.out.println(jsonInString);

        } catch (JsonGenerationException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
