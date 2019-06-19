package webinar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application implements CommandLineRunner {

    @Autowired
    DataSource dataSource;

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

        try {
            Connection dbconnection = dataSource.getConnection();
            // PreparedStatement pstmt = dbconnection.prepareStatement("DROP TABLE
            // webinar");
            // pstmt.execute();
            PreparedStatement pstmt = dbconnection
                    .prepareStatement("CREATE TABLE webinar (WebinarID int, Creador varchar(255), Fecha datetime)");
            pstmt.execute();
            for (int i = 0; i < 20; i++) {
                pstmt = dbconnection
                        .prepareStatement("INSERT INTO SQLUser.webinar VALUES (?, 'LUIS', CURRENT_TIMESTAMP)");
                pstmt.setInt(1, i);
                pstmt.execute();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}