package daos;

import java.sql.Connection;
import java.sql.DriverManager;

public class AdminTienda {
    public static Connection getConnection() throws Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
