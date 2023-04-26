


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/insertdata")
public class InsertServelet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("get called");
//        DBConnect dbConnect = new DBConnect();
//        dbConnect.doConnectDB();
        String category = req.getParameter("category");
        String date = req.getParameter("date");
        String expenseName = req.getParameter("expenseName");
        String description = req.getParameter("description");
        String Amount = req.getParameter("Amount");

        RequestDispatcher dispatcher = null;

//        PrintWriter out = resp.getWriter();
//        out.println(category);
//        out.println(date);
//        out.println(expenseName);
//        out.println(Amount);
        Connection  con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bjit_db","root","");
            PreparedStatement pst = con.prepareStatement("insert into expense(category,date , expenseName, description, Amount) values(?,?,?,?,?) ");
            pst.setString(1,category);
            pst.setString(2,date);
            pst.setString(3,expenseName);
            pst.setString(4,description);
            pst.setString(5,Amount);

            int rowCount = pst.executeUpdate();
            dispatcher = req.getRequestDispatcher("index.jsp");
            if(rowCount>0){
                req.setAttribute("status","success");

            }
            else {
                req.setAttribute("status","failed");

            }
            dispatcher.forward(req, resp);

        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try {
                con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


    }
}
