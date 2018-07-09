package JSON;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import spark.ResponseTransformer;


public class ObjectToJSON implements ResponseTransformer{
    private ObjectMapper mapper = new ObjectMapper();

    public String render(Object obj) throws IOException {
        return mapper.writeValueAsString(obj);
    }
}
