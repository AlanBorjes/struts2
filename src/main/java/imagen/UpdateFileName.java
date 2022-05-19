package imagen;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
public class UpdateFileName {
    public static String updateOldFileName(String imgFileName) {
        // Obtener el nombre del sufijo del archivo
        String lastOldFileName = imgFileName.substring(imgFileName.lastIndexOf("."));
        // Obtener y formatear la hora del sistema
        String time = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        // Genera un número aleatorio
        int num = new Random().nextInt(99999);
        // Devuelve el nuevo nombre de archivo
        return time + num + lastOldFileName;
    }
}
