import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
public class JDBC_LargeObjects_Example {

    public static void main(String[] args) throws Exception {
        // TODO Auto-generated method stub

        Connection connection = null;
        PreparedStatement pstatement = null;
        Scanner scanner = null;
        String img = "C:/Users/cgoka/Desktop/sample.jpg";

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/jdbc", "root", "123456");
            pstatement = connection
                    .prepareStatement("insert into employee values(?,?,?,?)");
            pstatement.setInt(1, 101);
            pstatement.setString(2, "Chandra Shekhar");
            pstatement.setString(3, "3000");
            File file = new File(img);
            FileInputStream stream = new FileInputStream(file);
            pstatement.setBinaryStream(4, stream);

            pstatement.executeUpdate();
            System.out.println("Image Inserted");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}