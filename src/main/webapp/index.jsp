<%@page import="java.sql.*" %>
<%
Connection connection = null;
Statement statement= null;
ResultSet  resultSet= null;

%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

 <style>
 .container{
 width:30%;
 background-color:#f1f1f1;
 padding:50px;
 float:left;
 margin:50px;
 }
 .tableStyle{
  width:51%;
 background-color:#f1f1f1;
  padding:50px;
  float:right;
   margin:50px;

 }
 .navbar-bran{
text-align:center;
background-color:#f1f1f1;
padding:20px;
 }

 </style>
  </head>
  <body>
  </nav>
      <h1 class="navbar-bran" >Expense Tracker</h1>

        <div class="container">

    <form method="post" action="insertdata">
      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Expense Category</label>
        <select name="category" id="exampleInputEmail1">
          <option value="Housing">Housing</option>
          <option value="Transportation">Transportation</option>
          <option value="Clothing">Clothing</option>
          <option value="Food">Food</option>
        </select>
      </div>
        <div class="mb-3">
              <label for="date" class="form-label">Date</label>
              <input type="date" name="date" class="form-control" id="date" aria-describedby="emailHelp">
            </div>
              <div class="mb-3">
                    <label for="expenseName" class="form-label">Expense Name</label>
                    <input name="expenseName" class="form-control" id="expenseName" aria-describedby="emailHelp">
                  </div>
                <div class="mb-3">
                                   <label for="description" class="form-label">Description</label>
                                   <input name="description" class="form-control" id="description" aria-describedby="emailHelp">
                                 </div>
               <div class="mb-3">
                          <label for="Amount" class="form-label">Amount</label>
                          <input type="number" name="Amount" class="form-control" id="Amount" aria-describedby="emailHelp">
                        </div>



      <button type="submit" class="btn btn-primary">Submit</button>
    </form>


          </div>
                  <div class="tableStyle">
                  <h2>Expense</h2>

                  <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Category</th>
                        <th scope="col">Date</th>
                        <th scope="col">Expanse Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Amount</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%
                                Class.forName("com.mysql.cj.jdbc.Driver");

                             connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bjit_db" , "root", "");
                             statement=connection.createStatement();
                             String sql ="select * from expense order by date desc";
                             resultSet = statement.executeQuery(sql);
                             while(resultSet.next()){
                    %>
                      <tr>
                        <th scope="row"><%=resultSet.getString("id") %></th>
                        <td><%=resultSet.getString("category") %></td>
                        <td><%=resultSet.getString("date") %></td>
                        <td><%=resultSet.getString("expenseName") %></td>
                        <td><%=resultSet.getString("description") %></td>
                        <td><%=resultSet.getString("Amount") %></td>

                      </tr>

                      <% } %>


                    </tbody>
                  </table>
                            </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  </body>
</html>