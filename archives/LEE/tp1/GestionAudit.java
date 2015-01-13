import java.lang.reflect.Method;
import java.io.PrintWriter;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class GestionAudit {
    
    public static void gestion (Object object, String methodName, Class... paramTypes) {
	try {
	    Class paramTypesArray[] = new Class[paramTypes.length];
	    int i = 0;
	    for (Class paramType : paramTypes)
		paramTypesArray[i ++] = paramType;
	    
	    Method method = object.getClass().getMethod(methodName, paramTypesArray);
	    
	    if (! method.isAnnotationPresent(Audit.class)) return;
	    
	    Audit auditValue = method.getAnnotation(Audit.class);
	    if (auditValue.value()) audit("[Audit] appel de " + methodName);
	}
	catch (Exception e) { Log.p(e); audit("[Audit exception] sur l'appel de " + methodName); }
    }

    private static void audit (String msg) { 
	System.err.println(msg); 
	// the next three lines are ugly
	try (PrintWriter toFile = new PrintWriter(new BufferedWriter(new FileWriter("admin.log", true)))
	) { toFile.println(msg); }
	catch (IOException e) { Log.p(e); }
    }

}