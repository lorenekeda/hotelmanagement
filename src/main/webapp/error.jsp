<%--
  Created by IntelliJ IDEA.
  User: lorenekeda
  Date: 29.03.25
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="true" %>
<html>
<head><title>Error</title></head>
<body>
<h2>An error occurred</h2>
<p>
  <%= (exception != null) ? exception.getMessage() : "An unknown error occurred." %>
</p>
</body>
</html>
